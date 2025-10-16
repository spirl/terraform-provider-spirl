# An existing SPIRL CI/CD Profile can be retrieved by providing the name of an existing CI/CD profile. The configuration of the CI/CD profile is available as read-only fields on the data item as demonstrated below.

data "spirl_cicd_profile" "existing_profile" {
  name = "my-github-cluster"
}

output "issuer" {
  value = data.spirl_cicd_profile.existing_profile.issuer
}
