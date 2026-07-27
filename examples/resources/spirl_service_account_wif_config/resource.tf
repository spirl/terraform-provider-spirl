resource "spirl_org_wif_issuer" "github" {
  name       = "github-actions"
  issuer_url = "https://token.actions.githubusercontent.com"
}

# Authenticate a specific repository branch
resource "spirl_service_account_wif_config" "deployer" {
  service_account_id  = "sa-1234567890"
  org_wif_issuer_name = spirl_org_wif_issuer.github.name

  claims = {
    sub = "repo:my-org/my-repo:ref:refs/heads/main"
    aud = "spirl"
  }
}

resource "spirl_org_wif_issuer" "jenkins" {
  name       = "jenkins"
  issuer_url = "https://jenkins.internal.example.com"
}

# Accept any bearer from a self-hosted issuer
resource "spirl_service_account_wif_config" "internal_sa" {
  service_account_id  = "sa-0987654321"
  org_wif_issuer_name = spirl_org_wif_issuer.jenkins.name
  allow_any_bearer    = true
}
