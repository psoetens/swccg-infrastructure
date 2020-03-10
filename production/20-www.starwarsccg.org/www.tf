
module "www_starwarsccg_org" {
  source            = "../../modules/aws-s3-website"
  s3_bucket_name    = "www.starwarsccg.org"
  domain_names      = ["www.starwarsccg.org", "starwarsccg.org"]
  ## cloudfront requires that the ssl cert be in us-east-1
  ## the certs with _use1_ in their name are in us-east-1 (use1)
  acm_arn           = data.terraform_remote_state.acm.outputs.www_starwarsccg_org_use1_acm_certificate_arn
  route53_zone_id   = data.terraform_remote_state.r53.outputs.zone_id
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module

module "starwarsccg_org" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "starwarsccg.org"
  redirect_target   = "https://www.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module

