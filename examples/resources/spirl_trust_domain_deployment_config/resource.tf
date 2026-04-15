resource "spirl_trust_domain_deployment_config" "main" {
  trust_domain_deployment_id = spirl_trust_domain_deployment.example.id

  sections = {
    KeyManager = <<-YAML
      section: KeyManager
      schema: v1
      spec:
        extensions:
          awsKMS:
            region: "us-east-1"
    YAML
  }
}
