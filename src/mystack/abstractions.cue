package demo

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
	configMap: "\(cluster)": "\(stack)": "\(v.namespace)": myappConfig: data: {
		database_host: v.database_host
	}

	let selectorLabels = {
		"app.kubernetes.io/name":     "myapp"
		"app.kubernetes.io/instance": env
	}

	deployment: "\(cluster)": "\(stack)": "\(v.namespace)": myapp: spec: {
		replicas: v.replicas
		template: spec: {
			_selectorLabels: selectorLabels

			containers: [{
				image: "\(v.image):\(v.image_tag)"
				name:  "myapp"
				volumeMounts: [{
					mountPath: "/myAppp/config"
					name:      "myappconfig"
				}]
			}]
			volumes: [{
				name: "myappconfig"
				configMap: name: "myappConfig"
			}]
		}
	}

	service: "\(cluster)": "\(stack)": "\(v.namespace)": myapp: spec: {
		_selectorLabels: selectorLabels

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
