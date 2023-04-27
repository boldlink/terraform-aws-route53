variable "name" {
  description = "(Required) This is the name of the hosted zone."
  type        = string
  default     = "boldlink-minimum-r53-example.com"
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
