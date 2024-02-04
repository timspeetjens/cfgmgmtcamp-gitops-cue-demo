package demo

import (
	k8s_core "k8s.io/api/core/v1"
)

#Service: [_]: [_]: [Namespace=_]: [Name=_]: k8s_core.#Service & {
	apiVersion: "v1"
	kind:       "Service"

	metadata: {
		name:      Name
		namespace: Namespace
	}
	spec: {
		_selectorLabels?: {[string]: string}
		if _selectorLabels == _|_ {
			selector: app: Name
		}
		if _selectorLabels != _|_ {
			selector: _selectorLabels
		}

		type: *"ClusterIP" | "NodePort"
	}
}

service: #Service
