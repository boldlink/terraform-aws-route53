[![License](https://img.shields.io/badge/License-Apache-blue.svg)](https://github.com/boldlink/terraform-aws-route53/blob/main/LICENSE)
[![Latest Release](https://img.shields.io/github/release/boldlink/terraform-aws-route53.svg)](https://github.com/boldlink/terraform-aws-route53/releases/latest)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/update.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/release.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/pr-labeler.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/module-examples-tests.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/checkov.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/auto-merge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)
[![Build Status](https://github.com/boldlink/terraform-aws-route53/actions/workflows/auto-badge.yaml/badge.svg)](https://github.com/boldlink/terraform-aws-route53/actions)

[<img src="https://avatars.githubusercontent.com/u/25388280?s=200&v=4" width="96"/>](https://boldlink.io)

# Terraform module example of complete and most common configuration

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.15.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_r53_vpc"></a> [r53\_vpc](#module\_r53\_vpc) | boldlink/vpc/aws | 3.0.3 |
| <a name="module_route53"></a> [route53](#module\_route53) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | VPC CIDR | `string` | `"10.1.0.0/16"` | no |
| <a name="input_enable_public_subnets"></a> [enable\_public\_subnets](#input\_enable\_public\_subnets) | Whether to enable public subnets | `bool` | `true` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Whether assign public IPs by default to instances launched on subnet | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) This is the name of the hosted zone. | `string` | `"boldlink-complete-example.com"` | no |
| <a name="input_records"></a> [records](#input\_records) | (Required for non-alias records) A string list of records. | `any` | <pre>[<br>  {<br>    "name": "test",<br>    "records": [<br>      "10.10.10.10"<br>    ],<br>    "ttl": "3600",<br>    "type": "A"<br>  },<br>  {<br>    "name": "www",<br>    "records": [<br>      "live.example.com"<br>    ],<br>    "set_identifier": "live",<br>    "ttl": "5",<br>    "type": "CNAME",<br>    "weighted_routing_policy": {<br>      "weight": 90<br>    }<br>  }<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the created resources | `map(string)` | <pre>{<br>  "Department": "DevOps",<br>  "Environment": "examples",<br>  "LayerId": "Example",<br>  "LayerName": "Example",<br>  "Owner": "hugo.almeida",<br>  "Project": "Examples",<br>  "user::CostCenter": "terraform-registry"<br>}</pre> | no |

## Outputs

No outputs.
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

#### BOLDLink-SIG 2023
