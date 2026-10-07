# Register a manual application in the Defakto Ledger.
resource "spirl_application" "billing_api" {
  name             = "billing-api"
  short_name       = "Billing API"
  agentic          = false
  owner            = "team-payments@example.com"
  runtime_platform = "Kubernetes"
}
