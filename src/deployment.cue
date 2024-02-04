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
		_selectorLabels?: {[string]: string}
		if _selectorLabels == _|_ {
			selector: matchLabels: app: Name
			template: metadata: labels: app: Name
		}
		if _selectorLabels != _|_ {
			selector: matchLabels: _selectorLabels
			template: metadata: labels: _selectorLabels
		}
	}
}

deployment: #Deployment
