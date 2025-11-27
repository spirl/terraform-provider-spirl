# A SPIRL realm can be created within a trust domain to organize and isolate clusters.
resource "spirl_realm" "production" {
  trust_domain_id = spirl_trust_domain.my_domain.id
  name            = "production"
}

resource "spirl_realm" "staging" {
  trust_domain_id = spirl_trust_domain.my_domain.id
  name            = "staging"
}

