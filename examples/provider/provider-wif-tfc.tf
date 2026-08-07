# Terraform Cloud WIF — TFC_WORKLOAD_IDENTITY_TOKEN is read automatically.
# Only service_account_id needs to be set explicitly.
provider "spirl" {
  service_account_id = "sa-1234567890"
}
