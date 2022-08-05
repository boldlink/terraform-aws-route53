locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name
  name       = "boldlink-complete-example.com"
  cidr_block = "192.168.0.0/16"
  tags = {
    environment        = "examples"
    Name               = local.name
    "user::CostCenter" = "terraform-registry"
  }
}
