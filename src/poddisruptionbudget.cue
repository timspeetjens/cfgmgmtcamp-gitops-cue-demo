package demo

import (
	k8s_policy "k8s.io/api/policy/v1"
)

#PodDisruptionBudget: [_]: [_]: [Namespace=_]: [Name=_]: k8s_policy.#PodDisruptionBudget & {
	apiVersion: "policy/v1"
	kind:       "PodDisruptionBudget"
}

podDisruptionBudget: #PodDisruptionBudget
