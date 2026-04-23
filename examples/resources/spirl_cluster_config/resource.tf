resource "spirl_cluster_config" "cluster_configs" {
  cluster_id = spirl_cluster.my_cluster.id

  sections = {
    AgentAttestation = <<-YAML
      section: AgentAttestation
      schema: v1
      spec:
        policies:
          - name: eks_cluster_policy
            requiredAttestors:
              - type: k8s_token
                config:
                  issuerURL: https://oidc.eks.us-east-1.amazonaws.com/id/ABCDEF123456
    YAML

    AttributeRedaction = <<-YAML
      section: AttributeRedaction
      schema: v1
      spec:
        policy:
          allowList:
            filters:
              - "kubernetes.pod.namespace"
    YAML
  }
}
