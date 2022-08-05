resource "aws_route53_zone" "this" {
  name              = var.name
  comment           = "Route53 hosted zone"
  delegation_set_id = var.vpc == null ? var.delegation_set_id : null
  force_destroy     = var.force_destroy

  dynamic "vpc" {
    for_each = var.vpc
    content {
      vpc_id     = vpc.value.vpc_id
      vpc_region = lookup(vpc.value, "vpc_region", null)
    }
  }

  tags = var.tags
}

# Route53 records
resource "aws_route53_record" "this" {
  count                            = length(var.records)
  zone_id                          = aws_route53_zone.this.zone_id
  name                             = try(var.records[count.index]["name"], null)
  type                             = try(var.records[count.index]["type"], null)
  ttl                              = try(var.records[count.index]["ttl"], 300)
  records                          = try(var.records[count.index]["records"], [])
  set_identifier                   = try(var.records[count.index]["set_identifier"], null)
  health_check_id                  = try(var.records[count.index]["health_check_id"], null)
  multivalue_answer_routing_policy = try(var.records[count.index]["multivalue_answer_routing_policy"], null)
  allow_overwrite                  = try(var.records[count.index]["allow_overwrite"], null)

  dynamic "alias" {
    for_each = try([var.records[count.index]["alias"]], [])
    content {
      name                   = lookup(alias.value, "name")
      zone_id                = lookup(alias.value, "zone_id")
      evaluate_target_health = lookup(alias.value, "evaluate_target_health")
    }
  }

  dynamic "failover_routing_policy" {
    for_each = try([var.records[count.index]["failover_routing_policy"]], [])
    content {
      type = lookup(failover_routing_policy.value, "type", null)
    }
  }

  dynamic "geolocation_routing_policy" {
    for_each = try([var.records[count.index]["geolocation_routing_policy"]], [])
    content {
      continent   = lookup(geolocation_routing_policy.value, "continent", null)
      country     = lookup(geolocation_routing_policy.value, "country", "*")
      subdivision = lookup(geolocation_routing_policy.value, "subdivision", null)
    }
  }

  dynamic "latency_routing_policy" {
    for_each = try([var.records[count.index]["latency_routing_policy"]], [])
    content {
      region = lookup(latency_routing_policy.value, "region", null)
    }
  }

  dynamic "weighted_routing_policy" {
    for_each = try([var.records[count.index]["weighted_routing_policy"]], [])
    content {
      weight = lookup(weighted_routing_policy.value, "weight", null)
    }
  }
}
