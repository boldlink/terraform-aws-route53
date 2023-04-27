module "r53_vpc" {
  source                = "boldlink/vpc/aws"
  version               = "3.0.3"
  name                  = "${var.name}-vpc"
  cidr_block            = var.cidr_block
  enable_public_subnets = var.enable_public_subnets
  tags                  = var.tags

  public_subnets = {
    public = {
      cidrs                   = local.public_subnets
      map_public_ip_on_launch = var.map_public_ip_on_launch
    }
  }
}

module "route53" {
  source = "../../"
  name   = var.name

  vpc = [
    {
      vpc_id = module.r53_vpc.vpc_id
    }
  ]

  records = var.records
  tags    = var.tags
}
