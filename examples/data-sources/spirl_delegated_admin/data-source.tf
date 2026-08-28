# Retrieve a delegated admin of a realm by user email
data "spirl_delegated_admin" "by_user" {
  trust_domain_id = spirl_trust_domain.my_domain.id
  realm_name      = "production"
  user_email      = "admin@example.com"
}

# Retrieve a delegated admin of a realm by service account name
data "spirl_delegated_admin" "by_service_account" {
  trust_domain_id      = spirl_trust_domain.my_domain.id
  realm_name           = "production"
  service_account_name = "ci-bot"
}

# Retrieve a delegated admin of a realm by IdP group name
data "spirl_delegated_admin" "by_idp_group" {
  trust_domain_id = spirl_trust_domain.my_domain.id
  realm_name      = "production"
  idp_group       = "platform-team"
}
