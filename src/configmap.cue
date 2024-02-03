package demo

import (
	k8s_core "k8s.io/api/core/v1"
)

#ConfigMap: [_]: [_]: [Namespace=_]: [Name=_]: k8s_core.#ConfigMap & {
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata: {
		name:      Name
		namespace: Namespace
	}
}

configMap: #ConfigMap
