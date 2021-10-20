
variable "aws_region" {
  type        = string
  description = "aws region for the bucket"
}

variable "bucket_name" {
  type        = string
  description = "name of the s3 bucket"
}

variable "tags" {
  default     = {}
  description = "tags for s3 bucket"
}
