# An existing SPIRL cluster can be retrieved by providing the name of the cluster and the trust domain ID. To fetch the trust domain ID, use the `spirl_trust_domain` data source as shown below.  The configuration of the cluster is available as read-only fields on the data item as demonstrated below.

data "spirl_trust_domain" "existing_domain" {
  domain_name = "example.com"
}

data "spirl_cluster" "existing_cluster" {
  name            = "cluster-a"
  trust_domain_id = data.spirl_trust_domain.existing_domain.id
}

output "path_template" {
  value = data.spirl_cluster.existing_cluster.path_template
}
