<!-- BEGIN_TF_DOCS -->
# VPC module - Submodule: `s3_log_bucket`

Internal submodule of the [`flow_logs` submodule](../..). It creates the S3 bucket used as a VPC Flow Logs destination when `log_destination_type = "s3"` and no existing destination is supplied: a bucket with a name prefix, public access blocked, server-side encryption, and a lifecycle rule scoped to `lifecycle_filter_prefix`. It is not intended to be used on its own.

## Usage

```hcl
module "s3_log_bucket" {
  source = "./modules/s3_log_bucket"

  name                    = "my-vpc"
  lifecycle_filter_prefix = "" # prefix of the objects the lifecycle transition applies to
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_public_access_block.flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.flow_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | (optional) describe your variable | `string` | n/a | yes |
| <a name="input_lifecycle_filter_prefix"></a> [lifecycle\_filter\_prefix](#input\_lifecycle\_filter\_prefix) | Prefix to use for the lifecycle transition rule | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_flow_logs_attributes"></a> [bucket\_flow\_logs\_attributes](#output\_bucket\_flow\_logs\_attributes) | Flow Logs S3 Bucket resource attributes. Full output of aws\_s3\_bucket. |
<!-- END_TF_DOCS -->