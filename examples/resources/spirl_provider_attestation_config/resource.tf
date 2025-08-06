resource "spirl_provider_attestation_config" "test" {
  name = "my-attestation-config"
  aws {
    role_arn = "arn:aws:iam::123456789012:role/my-role"
  }
}
