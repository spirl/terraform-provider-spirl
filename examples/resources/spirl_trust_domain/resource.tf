# Create a trust domain with defaults.
resource "spirl_trust_domain" "my_domain" {
  domain_name = "example.com"
  description = "A trust domain created with Terraform"
}

# A trust domain with a custom JWT issuer URL.
resource "spirl_trust_domain" "custom_issuer" {
  domain_name     = "example.com"
  jwt_issuer_mode = "custom"
  jwt_issuer      = "https://oidc.example.com"
}

# A trust domain with the JWT issuer explicitly disabled.
resource "spirl_trust_domain" "no_issuer" {
  domain_name     = "example.com"
  jwt_issuer_mode = "disabled"
}
