resource "spirl_cicd_profile" "test" {
  name              = "my-cicd-profile"
  type              = "gitlab-hybrid"
  issuer            = "https://gitlab.com"       // Optional, Required when using an on-prem type
  additional_claims = ["job_name", "git_commit"] // Optional, Additional claims to include
}
