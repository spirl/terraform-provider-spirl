# A cluster resource can be created for a trust domain created by Terraform.
resource "spirl_cluster" "my_cluster" {
  trust_domain_id = spirl_trust_domain.my_domain.id
  name            = "my-cluster"
  description     = "A cluster created with terraform"
  platform        = "k8s"
  public_key      = file("cluster-public-key.pem")
}

# A cluster can also be created for an existing trust domain created outside of Terraform.
resource "spirl_cluster" "my_cluster" {
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
  name            = "my-cluster"
  description     = "A cluster created with terraform"
  platform        = "k8s"
  public_key      = file("cluster-public-key.pem")
}
