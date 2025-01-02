# An existing SPIRL trust domain can be used as a data source by providing the name of the domain. The resulting data model is highly similar to a trust domain resource, so the two can be used interchangeably.

data "spirl_trust_domain" "existing_domain" {
  domain_name = "example.com"
}

output "agent_endpoint" {
  value = data.spirl_trust_domain.existing_domain.spirl_agent_endpoint
}
