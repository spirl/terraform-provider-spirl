---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "spirl_trust_domain_deployment Resource - spirl"
subcategory: ""
description: |-
  Create a deployment in a trust domain.
  -> Note: A trust domain deployment is only used when self hosting SPIRL trust domains. When using SPIRL's managed trust domains, this resource is not needed.
---

# spirl_trust_domain_deployment (Resource)

Create a deployment in a trust domain.

-> **Note:** A trust domain deployment is only used when self hosting SPIRL trust domains. When using SPIRL's managed trust domains, this resource is not needed.

## Example Usage

```terraform
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
```

<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `keys` (Attributes Map) The authentication keys for the trust domain deployment to communicate with the SPIRL control plane. (see [below for nested schema](#nestedatt--keys))
- `name` (String) The name of the trust domain deployment.
- `trust_domain_id` (String) The ID of the trust domain this deployment belongs to.

### Read-Only

- `id` (String) The ID of the trust domain deployment.

<a id="nestedatt--keys"></a>
### Nested Schema for `keys`

Required:

- `active` (Boolean) Whether the trust domain key is active (or disabled).
- `public_key` (String) The public key of the trust domain key.

Read-Only:

- `id` (String) The ID of the trust domain key.

## Import

Import is supported using the following syntax:

```shell
# Trust Domain Deployment can be imported using a combination of the trust-domain id
# and the trust domain deployment name separated by a forward slash
# Trust Domain ID: td-123456
# Trust Domain Deployment Name: my-trust-domain-deployment-name
terraform import spirl_trust_domain_deployment.example "td-123456/my-trust-domain-deployment-name"
```
