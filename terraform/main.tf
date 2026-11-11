module "environment" {
  source = "./environments/dev"

  aws_region  = var.aws_region
  domain_name = var.domain_name
}