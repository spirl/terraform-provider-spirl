---
# generated by https://github.com/hashicorp/terraform-plugin-docs
page_title: "spirl_trust_domain Data Source - spirl"
subcategory: ""
description: |-
  
---

# spirl_trust_domain (Data Source)





<!-- schema generated by tfplugindocs -->
## Schema

### Required

- `domain_name` (String) The name of the trust domain (typically your root domain, e.g., example.com)

### Read-Only

- `description` (String) An optional description of the trust domain
- `id` (String) The unique identifier for the trust domain
- `jwks_endpoint` (String) The endpoint where the JWT-SVID JWKS can be retrieved
- `jwt_issuer` (String) The identifier of the JWT-SVID issuer
- `oidc_discovery_endpoint` (String) The endpoint for OIDC discovery
- `spiffe_bundle_endpoint` (String) The endpoint where the SPIFFE trust bundle can be retrieved
- `spirl_agent_endpoint` (String) The endpoint used for the SPIRL agent