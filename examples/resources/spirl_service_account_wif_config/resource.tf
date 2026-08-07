resource "spirl_org_wif_issuer" "github" {
  name       = "github-actions"
  issuer_url = "https://token.actions.githubusercontent.com"
}

data "spirl_service_account" "deployer" {
  name = "my-deployer-sa"
}

resource "spirl_service_account_wif_config" "deployer" {
  service_account_id  = data.spirl_service_account.deployer.id
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
