module "r53_vpc" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  #checkov:skip=CKV_AWS_338:Ensure CloudWatch log groups retains logs for at least 1 year
  source                = "boldlink/vpc/aws"
  version               = "3.0.4"
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
