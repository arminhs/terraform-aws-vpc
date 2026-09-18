<!-- BEGIN_TF_DOCS -->
# VPC module - Submodule: `calculate_subnets_ipv6`

Internal submodule of the [AWS VPC module](../..). It turns the `subnets` map into per-AZ IPv6 `/64` prefixes from the VPC's IPv6 CIDR. Subnet types that set `assign_ipv6_cidr = true` are calculated; types that pass `ipv6_cidrs` are zipped onto the AZ list unchanged. It is called by the root module and is not intended to be used on its own.

## Usage

```hcl
module "calculate_subnets_ipv6" {
  source = "./modules/calculate_subnets_ipv6"

  cidr_ipv6 = "2a05:d01c:bc3:b200::/56"
  azs       = ["us-east-1a", "us-east-1b"]

  subnets = {
    public  = { assign_ipv6_cidr = true }                                      # calculated /64 per AZ
    private = { ipv6_cidrs = ["2a05:d01c:bc3:b210::/64", "2a05:d01c:bc3:b211::/64"] } # explicit
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72.0 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | >= 0.15.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subnet_calculator"></a> [subnet\_calculator](#module\_subnet\_calculator) | drewmullen/subnets/cidr | 1.0.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azs"></a> [azs](#input\_azs) | List of AZs to build. AZ is appened to each IP address prefix name. | `list(string)` | n/a | yes |
| <a name="input_cidr_ipv6"></a> [cidr\_ipv6](#input\_cidr\_ipv6) | CIDR value to use as base for calculating IP address prefixes. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Definition of subnets to be built. If `netmask` is passed will calculate CIDR. Else `cidrs` list is ziped to var.azs and merged into final output to be built into aws\_subnet(s). | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets_ipv6"></a> [subnets\_ipv6](#output\_subnets\_ipv6) | Outputs subnets prefixes by type (private, public). Derived from split(var.separator, <subnet\_name>). |
<!-- END_TF_DOCS -->