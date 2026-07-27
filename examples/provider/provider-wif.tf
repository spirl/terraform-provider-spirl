# WIF authentication — for Terraform Cloud or CI/CD pipelines.
# Alternatively set SPIRL_SERVICE_ACCOUNT_ID and SPIRL_OIDC_TOKEN env vars.
variable "oidc_token" {
  description = "OIDC token issued by the workload's identity provider."
  type        = string
  sensitive   = true
}

provider "spirl" {
  service_account_id = "sa-1234567890"
  oidc_token         = var.oidc_token
}
