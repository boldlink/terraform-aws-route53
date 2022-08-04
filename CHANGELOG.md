# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
- feat: add delagation set
- feat: add route53 health check
- feat: aws route53 hosted zone dnssec
- feat: aws route53 key signing key
- feat: aws route53 query log
- feat: aws route53 traffic policy
- feat: aws route53 traffic policy instance
- feat: aws route53 vpc association authorization
- feat: aws route53 zone association
- feat: Public Zone and public subdomain zones in complete example
- feat: Ability to add create_records using `count` or `for_each`
- feat: showcase usage of `route53_record` polices in example, e.g `failover_routing_policy`

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

[Unreleased]: https://github.com/boldlink/terraform-aws-route53/compare/1.0.1...HEAD

[1.0.0]: https://github.com/boldlink/terraform-aws-route53/releases/tag/1.0.0
[1.0.1]: https://github.com/boldlink/terraform-aws-route53/releases/tag/1.0.1
