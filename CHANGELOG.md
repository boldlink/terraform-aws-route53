# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- feat: add delagation set
- feat: add route53 health check
- feat: aws route53 hosted zone dnssec
- feat: aws route53 key signing key
- feat: aws route53 traffic policy
- feat: aws route53 traffic policy instance
- feat: aws route53 vpc association authorization
- feat: aws route53 zone association
- feat: Public Zone and public subdomain zones in complete example
- feat: Ability to add create_records using `count` or `for_each`
- feat: showcase usage of `route53_record` policies in example, e.g `failover_routing_policy`
- feat: showcase routing with a static website hosted in an s3 bucket
- feat: showcase in example alias usage with load balancer


## [1.1.0] - 2023-04-25
### Description
- feat: aws cloudwatch log group resource for DNS query logging.
- feat: aws clodwatch log resource policy.
- feat: aws Route53 query log resource.
- fix: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
- moved static values to variables.tf file in examples.

## [1.0.1] - 2022-08-04
### Description
- Added the `.github/workflow` folder (not supposed to run gitcommit)
- Re-factored examples,`minimum` and `complete`
- Added `CHANGELOG.md`
- Added `CODEOWNERS`
- Added `versions.tf`, which is important for pre-commit checks
- Added `Makefile` for examples automation
- Added `.gitignore` file

## [1.0.0] - 2022-04-20
### Description
- Initial commit
- feat: Route53 zone & records

[Unreleased]: https://github.com/boldlink/terraform-aws-route53/compare/1.0.2...HEAD
[1.1.0]: https://github.com/boldlink/terraform-aws-route53/releases/tag/1.1.0
[1.0.1]: https://github.com/boldlink/terraform-aws-route53/releases/tag/1.0.1
[1.0.0]: https://github.com/boldlink/terraform-aws-route53/releases/tag/1.0.0
