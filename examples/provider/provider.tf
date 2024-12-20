# If using enviornment variables to set the service account key ID and private key, use an empty provider block:
provider "spirl" {}

# Otherwise, set SPIRL service account credentials using the provider properties:
provider "spirl" {
  sa_key_id      = "sak-abcd1234"
  sa_private_key = file("path/to/private-key.pem")
}
