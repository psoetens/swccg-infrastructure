

module "forums_starwarsccg_org" {
  source            = "../../modules/aws-s3-website-redirect"
  s3_bucket_name    = "forums.starwarsccg.org"
  redirect_target   = "https://forum.starwarsccg.org/"
  env_name          = "prod"
  aws_region        = var.aws_region
} ## module

resource "aws_route53_record" "forums_starwarsccg_org" {
  zone_id = data.terraform_remote_state.r53.outputs.starwarsccg_org_zone_id
  name    = "forums.starwarsccg.org"
  type    = "A"

  alias {
    name                   = module.forums_starwarsccg_org.website_domain
    zone_id                = module.forums_starwarsccg_org.hosted_zone_id
    evaluate_target_health = false
  } ## alias

} ## resource aws_route53_record this

