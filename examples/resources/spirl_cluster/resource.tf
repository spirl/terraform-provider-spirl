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
