variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-2"
} ## variable aws_region

variable "aws_profile" {
  description = "AWS Profile"
  type        = string
  default     = "swccg-production"
} ## variable aws_profile

variable "starwarsccg_org_dns_entries" {
  type = list(object({
    name    = string
    type    = string
    ttl     = string
    records = list(string)
  }))
} ## variable starwarsccg_org_dns_entries

variable "swccg_org_dns_entries" {
  type = list(object({
    name    = string
    type    = string
    ttl     = string
    records = list(string)
  }))
} ## variable swccg_org_dns_entries

