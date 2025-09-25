# Generate an ED25519 key pair
resource "spirl_key_pair" "cluster_key" {
  algorithm = "ed25519"
}

# Create a trust domain
resource "spirl_trust_domain" "example" {
  domain_name = "example.com"
  description = "Example trust domain"
}

# Use the generated key pair in a cluster
resource "spirl_cluster" "example" {
  trust_domain_id = spirl_trust_domain.example.id
  name            = "my-cluster"
  description     = "Example cluster using generated key pair"
  platform        = "k8s"
  public_key      = spirl_key_pair.cluster_key.public_key_pem
}

# Output the public key (safe to expose)
output "public_key_pem" {
  description = "The public key in PEM format"
  value       = spirl_key_pair.cluster_key.public_key_pem
}

# Output the private key (marked as sensitive)
output "private_key_pem" {
  description = "The private key in PEM format"
  value       = spirl_key_pair.cluster_key.private_key_pem
  sensitive   = true
}

# Output the key pair ID
output "key_pair_id" {
  description = "The unique identifier for the key pair"
  value       = spirl_key_pair.cluster_key.id
}
