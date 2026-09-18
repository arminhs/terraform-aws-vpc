variable "name" {
  type        = string
  description = "Name prefix for the S3 bucket that stores the VPC Flow Logs."
}

variable "lifecycle_filter_prefix" {
  description = "Prefix to use for the lifecycle transition rule"
  type        = string
  default     = ""
}
