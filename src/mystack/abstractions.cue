package demo

import (
	"strings"
	"encoding/json"
	"uuid"
)

#MyApp: {
	cluster:   #ClusterName
	stack:     #StackName
	env:       #EnvironmentName
	namespace: #NamespaceName

	image:     string
	image_tag: string
	replicas:  int

	hostname: string

	database_host: string
}

_myApp: [Cluster=_]: [Stack=_]: [Env=_]: #MyApp & {
	cluster:   Cluster
	stack:     Stack
	env:       Env
	namespace: "\(Stack)-\(Env)"
}

for cluster, i in _myApp
for stack, j in i
for env, v in j {
	let configmapData = {
		database_host: v.database_host
	}

	let configmapHash = uuid.SHA1( uuid.ns.Nil, json.MarshalStream([configmapData]))

	let configmapName = strings.Join([
		"myapp",
		strings.Split( configmapHash, "-")[0],
	], "-")

	configMap: "\(cluster)": "\(stack)": "\(v.namespace)": "\(configmapName)": data: configmapData

	deployment: "\(cluster)": "\(stack)": "\(v.namespace)": myapp: spec: {
		replicas: v.replicas
		template: spec: {
			containers: [{
				image: "\(v.image):\(v.image_tag)"
				name:  "myapp"
				volumeMounts: [{
					mountPath: "/myAppp/config"
					name:      "myappconfig"
				}]
			}]
			volumes: [{
				name: configmapName
				configMap: name: "myappConfig"
			}]
		}
	}

	service: "\(cluster)": "\(stack)": "\(v.namespace)": myapp: spec: {
		ports: [{
			port:       80
			targetPort: "http"
			name:       "http"
		}]
	}

	route: "\(cluster)": "\(stack)": "\(v.namespace)": myapp: spec: {
		host: v.hostname
	}
}
