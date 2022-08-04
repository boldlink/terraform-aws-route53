module "r53_vpc" {
  source               = "git::https://github.com/boldlink/terraform-aws-vpc.git?ref=2.0.3"
  name                 = "${local.name}-vpc"
  account              = local.account_id
  region               = local.region
  cidr_block           = local.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = local.tags
}

module "route53" {
  source = "../../"
  name   = local.name
  vpc = [
    {
      vpc_id = module.r53_vpc.id
    }
  ]

  create_records = true
  record = {
    alias = {
      name    = "test"
      type    = "A"
      ttl     = "3600"
      records = ["10.10.10.10", ]
    },
    cname = {
      name = "www"
      type = "CNAME"
      ttl  = "5"

      weighted_routing_policy = [
        {
          weight = 90
        }
      ]

      set_identifier = "live"
      records        = ["live.example.com"]
    }
  }
}
