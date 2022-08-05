locals {
  name = "boldlink-minimum-r53-example.com"
}

module "minimum_route53" {
  source = "../../"
  name   = local.name
}
