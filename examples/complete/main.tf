module "r53_vpc" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
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

resource "aws_route53_health_check" "example" {
  fqdn              = "example.com"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "2"
  request_interval  = "30"
}

module "fail_over" {
  source = "../../"
  name   = "${var.name}-fail-over"
  records = [
    {
      name            = "failover.example.com"
      type            = "A"
      ttl             = 300
      records         = ["192.0.2.44"]
      set_identifier  = "primary"
      health_check_id = aws_route53_health_check.example.id
      failover_routing_policy = {
        type = "PRIMARY"
      }
    }
  ]
}

module "geo_and_alias" {
  source = "../../"
  name   = "${var.name}-alias"

  records = [
    {
      name           = "geo.example.com"
      type           = "A"
      ttl            = 300
      records        = ["192.0.2.44"]
      set_identifier = "US-West"
      geolocation_routing_policy = {
        country     = "US"
        subdivision = "CA"
      }
    },
    {
      name                             = "example.com"
      type                             = "A"
      records                          = ["192.0.2.44"]
      allow_overwrite                  = true
      multivalue_answer_routing_policy = true
      set_identifier                   = "example-with-multi-value-policy"
    },
    {
      name = "alias.example.com"
      type = "A"
      alias = {
        name                   = "s3-website-us-west-2.amazonaws.com"
        zone_id                = "Z3BJ6K6RIION7M"
        evaluate_target_health = true
      }
    }
  ]
  tags = var.tags
}
