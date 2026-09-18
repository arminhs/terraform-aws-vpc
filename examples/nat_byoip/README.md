<!-- BEGIN_TF_DOCS -->
# NAT Gateway BYOIP Example

This example demonstrates how to use the `nat_gateway_eip_configuration` variable to control
EIP allocation for NAT Gateways. Two modes beyond the default are shown:

1. **BYOIP pool** (`mode = "byoip_pool"`) — Allocates EIPs from a customer-owned public IPv4
   address pool. Useful when organizations need egress traffic to originate from their own IP range.

2. **Existing EIPs** (`mode = "existing"`) — Skips EIP creation entirely and attaches pre-existing
   EIP allocation IDs to the NAT Gateways. Useful when EIPs are managed outside this module
   (e.g., shared across stacks, or created by a separate IaC pipeline).

Inspired by community PR#179 (credit: [@hminaee-tc](https://github.com/hminaee-tc)).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc_byoip_pool"></a> [vpc\_byoip\_pool](#module\_vpc\_byoip\_pool) | ../.. | n/a |
| <a name="module_vpc_existing_eips"></a> [vpc\_existing\_eips](#module\_vpc\_existing\_eips) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_existing_eip_allocation_ids"></a> [existing\_eip\_allocation\_ids](#input\_existing\_eip\_allocation\_ids) | Map of AZ to pre-existing EIP allocation ID. | `map(string)` | <pre>{<br/>  "us-east-1a": "eipalloc-0123456789abcdef0",<br/>  "us-east-1b": "eipalloc-0123456789abcdef1"<br/>}</pre> | no |
| <a name="input_public_ipv4_pool"></a> [public\_ipv4\_pool](#input\_public\_ipv4\_pool) | EC2 public IPv4 address pool ID for BYOIP (e.g. ipv4pool-ec2-xxxxxxxxxxxxxxxxx). | `string` | `"ipv4pool-ec2-0123456789abcdef0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_byoip_pool_nat_gateway_ids"></a> [byoip\_pool\_nat\_gateway\_ids](#output\_byoip\_pool\_nat\_gateway\_ids) | Map of AZ to NAT Gateway ID for the BYOIP pool example. |
| <a name="output_byoip_pool_nat_public_ips"></a> [byoip\_pool\_nat\_public\_ips](#output\_byoip\_pool\_nat\_public\_ips) | Map of AZ to NAT Gateway public IP for the BYOIP pool example. |
| <a name="output_existing_eip_nat_gateway_ids"></a> [existing\_eip\_nat\_gateway\_ids](#output\_existing\_eip\_nat\_gateway\_ids) | Map of AZ to NAT Gateway ID for the existing-EIPs example. |
| <a name="output_existing_eip_nat_public_ips"></a> [existing\_eip\_nat\_public\_ips](#output\_existing\_eip\_nat\_public\_ips) | Map of AZ to NAT Gateway public IP for the existing-EIPs example. |
<!-- END_TF_DOCS -->