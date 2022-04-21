data "aws_vpc" "default" {
  filter {
    name   = "tag:Name"
    values = ["default"]
  }
}

module "route53" {
  source = "./../"
  name   = "example.com"
  vpc = [
    {
      vpc_id = data.aws_vpc.default.id
    }
  ]

  create_records = true
  record = {
    alias = {
      name = "www"
      type = "CNAME"
      ttl  = "5"
      weighted_routing_policy = [{
        weight = 10
      }]
      set_identifier = "dev"
      records        = ["dev.example.com"]
    },

    cname = {
      name = "www"
      type = "CNAME"
      ttl  = "5"

      weighted_routing_policy = [{
        weight = 90
      }]

      set_identifier = "live"
      records        = ["live.example.com"]
    }
  }
}

output "route53" {
  value = [
    module.route53,
  ]
}