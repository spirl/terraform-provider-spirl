# Retrieve information about an existing realm
data "spirl_realm" "production" {
  trust_domain_id = spirl_trust_domain.my_domain.id
  name            = "production"
}

