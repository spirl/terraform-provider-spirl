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
