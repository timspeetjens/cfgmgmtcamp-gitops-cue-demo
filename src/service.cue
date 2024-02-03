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
		selector: app: Name
		type: *"ClusterIP" | "NodePort"
	}
}

service: #Service
