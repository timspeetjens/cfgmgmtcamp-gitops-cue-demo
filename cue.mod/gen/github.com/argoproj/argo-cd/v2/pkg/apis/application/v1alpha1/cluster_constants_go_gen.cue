// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1

package v1alpha1

// EnvVarFakeInClusterConfig is an environment variable to fake an in-cluster RESTConfig using
// the current kubectl context (for development purposes)
#EnvVarFakeInClusterConfig: "ARGOCD_FAKE_IN_CLUSTER"

// EnvK8sClientQPS is the QPS value used for the kubernetes client (default: 50)
#EnvK8sClientQPS: "ARGOCD_K8S_CLIENT_QPS"

// EnvK8sClientBurst is the burst value used for the kubernetes client (default: twice the client QPS)
#EnvK8sClientBurst: "ARGOCD_K8S_CLIENT_BURST"

// EnvK8sClientMaxIdleConnections is the number of max idle connections in K8s REST client HTTP transport (default: 500)
#EnvK8sClientMaxIdleConnections: "ARGOCD_K8S_CLIENT_MAX_IDLE_CONNECTIONS"