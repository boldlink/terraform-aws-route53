[![Build Status](https://github.com/boldlink/terraform-aws-route53/action/workflows/pre-commit/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)

## Description
This Terraform module Manages Route53 resources.

Example(s) available [here](https://github.com/boldlink/terraform-aws-route53/tree/main/examples)

## Documentation

[AWS Route53 Documentation ](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)


[Terraform Route53 Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_records"></a> [create\_records](#input\_create\_records) | Whether or not to create record(s) | `bool` | `false` | no |
| <a name="input_delegation_set_id"></a> [delegation\_set\_id](#input\_delegation\_set\_id) | (Optional) The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones. | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment this resource is being deployed to | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) This is the name of the hosted zone. | `string` | n/a | yes |
| <a name="input_other_tags"></a> [other\_tags](#input\_other\_tags) | For adding an additional values for tags | `map(string)` | `{}` | no |
| <a name="input_record"></a> [record](#input\_record) | A list of records to create | `any` | `{}` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | (Optional) Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation\_set\_id | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the Hosted Zone. |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | A list of name servers in associated (or default) delegation set. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The Hosted Zone ID. This can be referenced by zone records. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
