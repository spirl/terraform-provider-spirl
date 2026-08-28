# A cluster can also be created for an existing trust domain created outside of
# Terraform by using the spirl_trust_domain data resource.
data "spirl_trust_domain" "existing_domain" {
  domain_name = "example.com"
}

# A cluster resource can be created for a trust domain created by Terraform.
resource "spirl_cluster" "my_cluster" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  name            = "my-cluster"
  description     = "A cluster created with terraform"
  platform        = "k8s"
  public_key      = file("cluster-public-key.pem")
}

resource "spirl_cluster" "my_cluster" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  name            = "my-cluster"
  description     = "A cluster created with terraform"
  platform        = "k8s"
  public_key      = file("cluster-public-key.pem")
}


# A cluster of linux nodes can be created by setting the platform to "linux".
# This is a node-group within spirlctl.
resource "spirl_cluster" "my_cluster" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  name            = "linux-cluster"
  description     = "A nodepool cluster created with terraform"
  platform        = "linux"
  public_key      = file("cluster-public-key.pem")
}

# Optional customization templates can be provided for X.509 and JWT SVIDs
# issued to workloads in the cluster.
resource "spirl_cluster" "my_cluster" {
  trust_domain_id             = data.spirl_trust_domain.existing_domain.id
  name                        = "my-cluster"
  description                 = "A cluster created with terraform"
  platform                    = "k8s"
  public_key                  = file("cluster-public-key.pem")
  x509_customization_template = "CN=Test"
  jwt_customization_template  = "namespace={{kubernetes.pod.namespace}},pod_service_account={{kubernetes.pod.service_account}}"
}

# Cluster in a specific realm
resource "spirl_realm" "production" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  name            = "production"
}

resource "spirl_cluster" "prod_cluster" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  realm_name      = spirl_realm.production.name
  name            = "prod-k8s-cluster"
  description     = "A cluster in the production realm"
  platform        = "k8s"
  public_key      = file("cluster-public-key.pem")
  path_template   = "/prod/{{kubernetes.pod.namespace}}/{{kubernetes.pod.service_account}}"
}

# Serverless cluster (agentless, keyless, versionless).
#
# Workloads attest per request through a Serverless SDK rather than via an
# installed agent, so a serverless cluster takes no public_key, path_template,
# customization templates, k8s_psat block or num_version_history -- the API
# rejects all of them. SPIFFE ID paths come from the pathTemplate inside the
# cluster's ServerlessAttestation policy instead.
#
# Requires the serverless_realm_enabled feature flag for your organization.
resource "spirl_realm" "serverless" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  name            = "serverless"
}

resource "spirl_cluster" "serverless_cluster" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  realm_name      = spirl_realm.serverless.name
  name            = "lambda-workloads"
  description     = "An agentless serverless cluster"
  platform        = "serverless"
}

# The attestation policy is applied as a normal configuration section. On a realm
# cluster the pathTemplate must be realm-first.
resource "spirl_cluster_config" "serverless_cluster" {
  cluster_id = spirl_cluster.serverless_cluster.id

  sections = {
    "ServerlessAttestation" = <<-YAML
      section: ServerlessAttestation
      schema: v1
      spec:
        policies:
          - name: aws-lambda
            svidPolicy:
              pathTemplate: "/{{realm.name}}/aws/{{aws_token.account.id}}"
            requiredAttestors:
              - type: aws_token
                config:
                  issuerURLs:
                    - "https://sts.amazonaws.com/123456789012"
    YAML
  }
}

# Serverless clusters cannot be changed in place: the API has no update
# operation for them, so altering one requires replacing the resource, which
# leaves a window where the cluster issues no SVIDs.
#
# Two state quirks to expect on a serverless cluster, neither of which affects
# issuance:
#
#   * version_id and version_created_at are always null, because serverless
#     clusters have no cluster version.
#   * num_version_history always reads back as 10, its schema default, even
#     though a versionless cluster retains no versions. It is inert, and it must
#     stay at the default rather than null: Terraform applies the default
#     whenever the config value is null, so a null in state would leave a
#     permanent diff that no apply could resolve.

# Cluster with K8s PSAT agent attestation
# The k8s_psat block configures Kubernetes Projected Service Account Token
# attestation for the SPIRL agent.
resource "spirl_cluster" "eks_cluster" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  name            = "eks-cluster"
  description     = "An EKS cluster with PSAT agent attestation"
  platform        = "k8s"

  k8s_psat {
    # The OIDC issuer URL for the Kubernetes cluster.
    # For EKS, this is typically https://oidc.eks.<region>.amazonaws.com/id/<cluster-id>
    issuer_url = "https://oidc.eks.us-west-2.amazonaws.com/id/EXAMPLE123"

    # Optional: defaults to "spirl-agent"
    service_account_name = "spirl-agent"

    # Optional: defaults to "spirl-system"
    service_account_namespace = "spirl-system"
  }
}
