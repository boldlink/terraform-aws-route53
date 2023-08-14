module "minimum_route53" {
  #checkov:skip=CKV_AWS_338:Ensure CloudWatch log groups retains logs for at least 1 year
  source = "../../"
  name   = var.name
  tags   = var.tags
}
