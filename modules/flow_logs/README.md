<!-- BEGIN_TF_DOCS -->
# VPC module - Submodule: flow\_logs

Internal submodule of the [AWS VPC module](../..). It creates a VPC Flow Log and, unless a destination is supplied, the destination itself: a CloudWatch log group with an IAM role, or an S3 bucket via the nested `s3_log_bucket` module. It is called by the root module when `var.vpc_flow_logs` is set and is not intended to be used on its own.

## Usage

```hcl
module "flow_logs" {
  source = "./modules/flow_logs"

  name   = "my-vpc"
  vpc_id = aws_vpc.main.id

  flow_log_definition = {
    log_destination_type = "cloud-watch-logs" # options: "s3", "none"
    retention_in_days    = 180
    # log_destination = "<existing log group or bucket ARN>" # omit to create one
    # iam_role_arn    = "<existing role ARN>"                 # omit to create one
  }

  log_bucket_lifecycle_filter_prefix = null # only used for the "s3" destination
  tags                               = { env = "prod" }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_log_bucket"></a> [s3\_log\_bucket](#module\_s3\_log\_bucket) | ./modules/s3_log_bucket | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_flow_log.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_role.flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_flow_log_definition"></a> [flow\_log\_definition](#input\_flow\_log\_definition) | Definition of the Flow Logs (FL) to create. Can define pre-existing log\_destination / iam\_role\_arn or theyll be created, default is Cloud Watch. | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name to give the VPC Flow Logs and optional resources. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create flow logs for. | `string` | n/a | yes |
| <a name="input_log_bucket_lifecycle_filter_prefix"></a> [log\_bucket\_lifecycle\_filter\_prefix](#input\_log\_bucket\_lifecycle\_filter\_prefix) | Prefix to use for the lifecycle transition rule in the flowlogs bucket | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_flow_log"></a> [flow\_log](#output\_flow\_log) | Flow Log information. |
<!-- END_TF_DOCS -->