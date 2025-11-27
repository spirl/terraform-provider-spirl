# Assign a realm role to a user
resource "spirl_realm_role_assignment" "user_admin" {
  trust_domain_id = spirl_trust_domain.my_domain.id
  realm_name      = spirl_realm.production.name
  role_name       = "Administrator"
  user_email      = "admin@example.com"
}

# Assign a realm role to a service account
resource "spirl_realm_role_assignment" "sa_admin" {
  trust_domain_id      = spirl_trust_domain.my_domain.id
  realm_name           = spirl_realm.production.name
  role_name            = "Administrator"
  service_account_name = "automation-sa"
}

