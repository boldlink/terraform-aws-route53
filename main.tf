resource "aws_route53_zone" "this" {
  name              = var.name
  comment           = "Route53 hosted zone"
  delegation_set_id = var.vpc == null ? var.delegation_set_id : null
  force_destroy     = var.force_destroy
  dynamic "vpc" {
    for_each = var.vpc
    content {
      vpc_id = vpc.value.vpc_id
      #vpc_region = lookup(vpc.value, "vpc_region", null)
    }
  }

  tags = merge(
    {
      "Name"        = var.name
      "Environment" = var.environment
    },
    var.other_tags,
  )
}

# Route53 records

resource "aws_route53_record" "this" {
  for_each                         = var.create_records ? var.record : {}
  zone_id                          = aws_route53_zone.this.zone_id
  name                             = each.key
  type                             = lookup(each.value, "type")
  ttl                              = lookup(each.value, "ttl", 300)
  records                          = lookup(each.value, "records", null)
  set_identifier                   = lookup(each.value, "set_identifier", null)
  health_check_id                  = lookup(each.value, "health_check_id", null)
  multivalue_answer_routing_policy = lookup(each.value, "multivalue_answer_routing_policy", null)
  allow_overwrite                  = lookup(each.value, "allow_overwrite", null)

  dynamic "alias" {
    for_each = lookup(each.value, "alias", [])
    content {
      name                   = lookup(alias.value, "name")
      zone_id                = lookup(alias.value, "zone_id")
      evaluate_target_health = lookup(alias.value, "evaluate_target_health")
    }
  }

  dynamic "failover_routing_policy" {
    for_each = lookup(each.value, "failover_routing_policy", [])
    content {
      type = lookup(failover_routing_policy.value, "type")
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = lookup(each.value, "geolocation_routing_policy", [])
    content {
      continent   = lookup(geolocation_routing_policy.value, "continent")
      country     = lookup(geolocation_routing_policy.value, "country", "*")
      subdivision = lookup(geolocation_routing_policy.value, "subdivision")
    }
  }

  dynamic "latency_routing_policy" {
    for_each = lookup(each.value, "latency_routing_policy", [])
    content {
      region = lookup(latency_routing_policy.value, "region")
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = lookup(each.value, "weighted_routing_policy", [])
    content {
      weight = lookup(weighted_routing_policy.value, "weight")
    }
  }
}