# A SPIRL trust domain can be created using a trust domain resource. Alternatively, an existing trust domain can be used via the trust domain data source.
resource "spirl_trust_domain" "my_domain" {
  domain_name = "example.com"
  description = "A trust domain created with Terraform"
}
