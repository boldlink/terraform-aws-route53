variable "name" {
  description = "(Required) This is the name of the hosted zone."
  type        = string
  default     = "boldlink-complete-example.com"
}

variable "cidr_block" {
  type        = string
  description = "VPC CIDR"
  default     = "10.1.0.0/16"
}

variable "enable_public_subnets" {
  type        = bool
  description = "Whether to enable public subnets"
  default     = true
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether assign public IPs by default to instances launched on subnet"
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the created resources"
  default = {
    Environment        = "examples"
    "user::CostCenter" = "terraform-registry"
    Department         = "DevOps"
    Project            = "Examples"
    Owner              = "hugo.almeida"
    LayerName          = "Example"
    LayerId            = "Example"
  }
}

variable "records" {
  description = "(Required for non-alias records) A string list of records."
  type        = any
  default = [
    {
      name    = "test"
      type    = "A"
      ttl     = "3600"
      records = ["10.10.10.10"]
    },
    {
      name = "www"
      type = "CNAME"
      ttl  = "5"

      weighted_routing_policy = {
        weight = 90
      }

      set_identifier = "live"
      records        = ["live.example.com"]
    },
    {
      name           = "latency.example.com"
      type           = "A"
      ttl            = 300
      records        = ["192.0.2.44"]
      set_identifier = "us-west-2"
      latency_routing_policy = {
        region = "us-west-2"
      }
    },
    {
      name           = "weighted.example.com"
      type           = "A"
      ttl            = 300
      records        = ["192.0.2.44"]
      set_identifier = "weight-1"
      weighted_routing_policy = {
        weight = 10
      }
    }
  ]
}
