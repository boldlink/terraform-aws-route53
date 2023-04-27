[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-route53/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-route53.svg)](https://github.com/boldlink/terraform-aws-route53/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

## Description
This Terraform module Manages Route53 resources.

### Why choose this module over the standard resources
- Default and custom configurations included in this module have been validated by Checkov. This ensures that the configurations adhere to best practices and security standards, reducing the risk of misconfiguration and security vulnerabilities.

- This module has elaborate examples that you can use to setup your route53 zones and records within a very short time.

Example(s) available [here](./examples)


### Query logging
- There are restrictions on the configuration of query logging. Notably, the CloudWatch log group must be in the us-east-1 region, a permissive CloudWatch log resource policy must be in place, and the Route53 hosted zone must be public. See [Configuring Logging for DNS Queries](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/query-logs.html?console_help=true#query-logs-configuring) for additional details.

## Usage
*NOTE*: These examples use the latest version of this module

```console
module "minimum_route53" {
  source         = "boldlink/route53/aws"
  name           = var.name
}
```

## Documentation

[AWS Route53 Documentation ](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)


[Terraform Route53 Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.64.0 |
| <a name="provider_aws.us-east-1"></a> [aws.us-east-1](#provider\_aws.us-east-1) | 4.64.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_route53_query_log.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_query_log) | resource |
| [aws_route53_record.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.route53_query_logging_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_comment"></a> [comment](#input\_comment) | A comment for the hosted zone. | `string` | `"Managed by Terraform"` | no |
| <a name="input_delegation_set_id"></a> [delegation\_set\_id](#input\_delegation\_set\_id) | (Optional) The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones. | `string` | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | (Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) This is the name of the hosted zone. | `string` | n/a | yes |
| <a name="input_records"></a> [records](#input\_records) | A list of records to create | `any` | `[]` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0. If you select 0, the events in the log group are always retained and never expire. | `number` | `30` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the zone | `map(string)` | `{}` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | (Optional) Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation\_set\_id | `any` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | The Amazon Resource Name (ARN) of the Hosted Zone. |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | A list of name servers in associated (or default) delegation set. |
| <a name="output_tags_all"></a> [tags\_all](#output\_tags\_all) | A map of tags assigned to the resource, including those inherited from the provider default\_tags |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The Hosted Zone ID. This can be referenced by zone records. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Third party software
This repository uses third party software:
* [pre-commit](https://pre-commit.com/) - Used to help ensure code and documentation consistency
  * Install with `brew install pre-commit`
  * Manually use with `pre-commit run`
* [terraform 0.14.11](https://releases.hashicorp.com/terraform/0.14.11/) For backwards compatibility we are using version 0.14.11 for testing making this the min version tested and without issues with terraform-docs.
* [terraform-docs](https://github.com/segmentio/terraform-docs) - Used to generate the [Inputs](#Inputs) and [Outputs](#Outputs) sections
  * Install with `brew install terraform-docs`
  * Manually use via pre-commit
* [tflint](https://github.com/terraform-linters/tflint) - Used to lint the Terraform code
  * Install with `brew install tflint`
  * Manually use via pre-commit

### Makefile
The makefile contained in this repo is optimized for linux paths and the main purpose is to execute testing for now.
* Create all tests:
`$ make tests`
* Clean all tests:
`$ make clean`

#### BOLDLink-SIG 2023
