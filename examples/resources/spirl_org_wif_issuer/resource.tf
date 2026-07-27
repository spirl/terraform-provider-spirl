# GitHub Actions issuer using OIDC auto-discovery
resource "spirl_org_wif_issuer" "github" {
  name       = "github-actions"
  issuer_url = "https://token.actions.githubusercontent.com"
}

# Custom issuer with an explicit JWKS URL
resource "spirl_org_wif_issuer" "custom" {
  name       = "my-custom-issuer"
  issuer_url = "https://idp.example.com"
  jwks_url   = "https://idp.example.com/.well-known/jwks.json"
}

# Issuer with PEM-encoded public key (sensitive, write-only)
resource "spirl_org_wif_issuer" "internal" {
  name       = "internal-issuer"
  issuer_url = "https://internal-idp.example.com"
  jwks_pem   = file("path/to/public-key.pem")
}
