resource "spirl_trust_domain" "my_domain" {
  domain_name = "example.com"
  description = "A trust domain created with Terraform"
  self_hosted = true
}

resource "spirl_trust_domain_deployment" "deployment1" {
  trust_domain_id = spirl_trust_domain.my_domain.id
  name            = "deployment1"
  keys = {
    "key1" = {
      public_key = file("cluster-public-key-1.pem")
      active     = true
    }
  }
}
