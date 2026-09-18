<!-- BEGIN_TF_DOCS -->
# VPC module - Example: IPAM secondary CIDR

This example builds an Amazon VPC whose primary and secondary IPv4 CIDRs are both allocated from Amazon VPC IPAM:

* IPAM with a top-level `10.0.0.0/8` pool and one regional `10.0.0.0/16` pool (module `aws-ia/ipam/aws`)
* Primary VPC in 2 AZs with a `/24` allocated from the regional pool
    * 1 public subnet type (`/28`) with a NAT gateway in a single AZ
    * 1 private subnet type (`/28`) routing through the NAT gateway
* Secondary CIDR (`/26`) attached to the same VPC, also allocated by IPAM
    * Private subnets use explicit `cidrs` because the secondary CIDR is not known until apply time
    * Reuses the primary VPC's NAT gateways via `vpc_secondary_cidr_natgw`
* Routing:
    * IPv4 egress from all private subnets through the single NAT gateway

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ipam"></a> [ipam](#module\_ipam) | aws-ia/ipam/aws | >= 2.0.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../.. | n/a |
| <a name="module_vpc_secondary_cidr_ipam"></a> [vpc\_secondary\_cidr\_ipam](#module\_vpc\_secondary\_cidr\_ipam) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region. | `string` | `"eu-west-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secondary_cidr_block"></a> [secondary\_cidr\_block](#output\_secondary\_cidr\_block) | The secondary CIDR block allocated by IPAM. |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC ID of the primary VPC. |
<!-- END_TF_DOCS -->