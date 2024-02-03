package demo

import (
	oc_route "github.com/openshift/api/route/v1"
	"k8s.io/apimachinery/pkg/util/intstr"
)

#Route: [_]: [_]: [Namespace=_]: [Name=_]: oc_route.#Route & {
	apiVersion: "route.openshift.io/v1"
	kind:       "Route"
	metadata: {
		name:      Name
		namespace: Namespace
	}
	spec: {
		tls: {...} | *{
			termination: "edge"
		}
		to: {...} | *{
			kind: "Service"
			name: string | *Name
			...
		}
		port: targetPort: intstr.#IntOrString | *"http"
	}
}

route: #Route
