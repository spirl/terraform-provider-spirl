---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "spirl_federation_link Resource - spirl"
subcategory: ""
description: |-
  Provisions a SPIFFE federation link between trust domains inside SPIRL.
---

# spirl_federation_link (Resource)

Provisions a SPIFFE federation link between trust domains inside SPIRL.

## Example Usage

```terraform
resource "spirl_federation_link" "test" {
  trust_domain_id           = spirl_trust_domain.my_domain.id
  foreign_trust_domain_name = spirl_trust_domain.foreign_domain.domain_name
  endpoint_url              = spirl_trust_domain.foreign_domain.spiffe_bundle_endpoint
}


resource "spirl_trust_domain" "my_domain" {
  domain_name = "my-trust-domain.internal"
  description = "A self-hosted trust domain created with terraform"
  self_hosted = false
}


resource "spirl_trust_domain" "foreign_domain" {
  domain_name = "foreign-trust-domain.internal"
  description = "A trust domain created with terraform"
  self_hosted = false
}
```

<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `endpoint_url` (String) The URL of the SPIFFE bundle endpoint for the foreign trust domain.
- `foreign_trust_domain_name` (String) The name of the foreign trust domain to federate with.
- `trust_domain_id` (String) The trust domain ID of the trust domain that will trust a foreign domain.

## Import

Import is supported using the following syntax:

```shell
# Clusters can be imported using a combination of the trust-domain id
# and the foreign trust domain name separated by a forward slash
# Trust Domain ID: td-123456
# Foreign Trust Domain Name: foreign-trust-domain-name.com
terraform import spirl_cluster.example "td-123456/foreign-trust-domain-name.com"
```
