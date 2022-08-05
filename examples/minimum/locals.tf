locals {
  name = "boldlink-minimum-r53-example.com"
  tags = {
    environment        = "examples"
    Name               = local.name
    "user::CostCenter" = "terraform-registry"
  }
}
