# An existing SPIRL trust domain can be retrieved by providing the domain name of the trust domain. The configuration of the trust domain is available as read-only fields on the data item as demonstrated below.

data "spirl_trust_domain" "existing_domain" {
  domain_name = "example.com"
}

output "agent_endpoint" {
  value = data.spirl_trust_domain.existing_domain.spirl_agent_endpoint
}
