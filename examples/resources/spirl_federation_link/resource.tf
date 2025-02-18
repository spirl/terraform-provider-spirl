resource "spirl_federation_link" "test" {
  trust_domain_id           = spirl_trust_domain.my_domain.id
  foreign_trust_domain_name = spirl_trust_domain.foreign_domain.domain_name
  endpoint_url              = spirl_trust_domain.foreign_domain.spiffe_bundle_endpoint
}


resource "spirl_trust_domain" "my_domain" {
  domain_name = "my-trust-domain.internal"
  description = "A self-hosted trust domain created with terraform"
  self_hosted = false
}


resource "spirl_trust_domain" "foreign_domain" {
  domain_name = "foreign-trust-domain.internal"
  description = "A trust domain created with terraform"
  self_hosted = false
}
