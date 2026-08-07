# WIF authentication — for CI/CD platforms that expose an OIDC token as an
# environment variable (GitHub Actions, GitLab CI, etc.).
# Alternatively set SPIRL_SERVICE_ACCOUNT_ID and SPIRL_OIDC_TOKEN env vars.
# For Terraform Cloud, see the Terraform Cloud WIF Authentication example below.
variable "oidc_token" {
  description = "OIDC token issued by the workload's identity provider."
  type        = string
  sensitive   = true
}

provider "spirl" {
  service_account_id = "sa-1234567890"
  oidc_token         = var.oidc_token
}
