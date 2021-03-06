
data "aws_caller_identity" "current" {}

###################################

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
}

variable "env_name" {
  description = "Environment Name"
  type        = string
} ## variable

variable "s3_bucket_name" {
  description = "Website base URL, such as www.starwarsccg.org"
  type        = string
} ## variable

variable "route53_zone_id" {
  description = "Route53 Zone ID"
  type        = string
} ## variable

variable "acm_arn" {
  description = "ACM arn. The ACM certificate must be in US-EAST-1."
  type        = string
} ## variable

variable "domain_names" {
  description = "list of domain names hosted here"
  type        = list
} ## variable

variable "default_root_object" {
  description = "index.html"
  type        = string
  default     = "index.html"
} ## variable



locals {
  s3_origin_id = "S3-${var.s3_bucket_name}"
}



