# SPIRL Terraform Provider
  
This module is a [Terraform](https://www.terraform.io) provider for SPIRL built on the [Terraform Plugin Framework](https://github.com/hashicorp/terraform-plugin-framework). It contains the plugin, documentation, and examples needed to use SPIRL natively in Terraform:

- Terraform Provider, Resources, and Data Sources (`internal/provider`)
- Examples (`examples/`) and a full demonstration (`demo/`)
- Generated documentation (`docs/`),

## Contributing

### Development

#### Prerequisities

- [Terraform](https://developer.hashicorp.com/terraform/downloads) >= 1.0
- [Go](https://golang.org/doc/install) >= 1.21

## Building and Testing

1. Clone the repository
2. Enter the repository directory
3. Build the provider using the `go install` command:
4. Have a local override for Terraform to test the local provider. See [Locally install provider and verify with Terraform](https://developer.hashicorp.com/terraform/tutorials/providers-plugin-framework/providers-plugin-framework-provider#locally-install-provider-and-verify-with-terraform))).

### Publishing

See [Publishing](https://developer.hashicorp.com/terraform/registry/providers/publishing).

## Acceptance Testing

### Prerequisites

In order to conduct acceptance testing, you first need to:

1. Have a persistent service account key used for acceptance testing.
2. Have a persistent trust domain the service account can use for data source acceptance testing.

### Testing

In order to run the full suite of Acceptance tests, run the command below.

_Note:_ Acceptance tests create and destroy real resources. Timeout values may need to be adjusted.

```sh
SPIRL_SA_KEY_ID=<service account key ID> SPIRL_SA_PRIVATE_KEY=<service account private key> EXISTING_TRUST_DOMAIN=<existing domain> TC_ACC=true go test -v -timeout 15m
```
