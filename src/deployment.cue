package demo

import (
	k8s_apps "k8s.io/api/apps/v1"
)

#Deployment: [_]: [_]: [Namespace=_]: [Name=_]: k8s_apps.#Deployment & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      Name
		namespace: Namespace
	}
	spec: {
		selector: matchLabels: app: Name
		template: metadata: labels: app: Name
	}
}

deployment: #Deployment
