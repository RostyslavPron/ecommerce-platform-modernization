module "vpc" {
  source = "../../modules/vpc"

  project_name = "ecommerce-modernization"

  vpc_cidr = "10.0.0.0/16"

  availability_zones = [
    "us-east-1a",
    "us-east-1b"
  ]
}

module "security_groups" {
  source = "../../modules/security-groups"

  project_name = "ecommerce-modernization"

  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source = "../../modules/alb"

  project_name = "ecommerce-modernization"

  vpc_id = module.vpc.vpc_id

  public_subnets = module.vpc.public_subnets

  alb_security_group_id = module.security_groups.alb_security_group_id
}

module "ecr" {
  source = "../../modules/ecr"

  project_name = "ecommerce-modernization"
}