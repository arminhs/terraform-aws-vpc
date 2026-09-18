<!-- BEGIN_TF_DOCS -->
# VPC module - Submodule: calculate\_subnets

Internal submodule of the [AWS VPC module](../..). It turns the `subnets` map into per-AZ IPv4 CIDR blocks. Subnet types that pass `netmask` are calculated from the VPC CIDR; types that pass `cidrs` are zipped onto the AZ list unchanged; IPv6-only types are excluded. It is called by the root module and is not intended to be used on its own.

## Usage

```hcl
module "calculate_subnets" {
  source = "./modules/calculate_subnets"

  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b"]

  subnets = {
    public  = { netmask = 24 }                          # calculated
    private = { cidrs = ["10.0.8.0/24", "10.0.9.0/24"] } # explicit, one per AZ
  }

  optimize_subnet_cidr_ranges = false # true sorts by netmask to pack the address space
}
```

Calculated types are allocated in lexicographic order of their key names, so adding or removing a type can shift the CIDRs of existing subnets. See the root README for the production recommendation to use explicit `cidrs`.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72.0 |

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
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR value to use as base for calculating IP address prefixes. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Defition of subnets to be built. If `netmask` is passed will calculate CIDR. Else `cidrs` list is ziped to var.azs and merged into final output to be built into aws\_subnet(s). | `any` | n/a | yes |
| <a name="input_optimize_subnet_cidr_ranges"></a> [optimize\_subnet\_cidr\_ranges](#input\_optimize\_subnet\_cidr\_ranges) | Sort subnets to calculate by their netmask to efficiently use IP space. | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets_by_type"></a> [subnets\_by\_type](#output\_subnets\_by\_type) | Outputs subnets prefixes by type (private, public). Derived from split(var.separator, <subnet\_name>). |
| <a name="output_subnets_with_ipv6_native"></a> [subnets\_with\_ipv6\_native](#output\_subnets\_with\_ipv6\_native) | Outputs types of subnets that are ipv6\_native. |
<!-- END_TF_DOCS -->