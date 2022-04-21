variable "name" {
  description = "(Required) This is the name of the hosted zone."
  type        = string
}

variable "delegation_set_id" {
  description = "(Optional) The ID of the reusable delegation set whose NS records you want to assign to the hosted zone. Conflicts with vpc as delegation sets can only be used for public zones."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = " (Optional) Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  type        = bool
  default     = true
}

variable "vpc" {
  description = "(Optional) Configuration block(s) specifying VPC(s) to associate with a private hosted zone. Conflicts with the delegation_set_id "
  type        = any
  default     = []
}

#Tags
variable "environment" {
  type        = string
  description = "The environment this resource is being deployed to"
  default     = null
}

variable "other_tags" {
  description = "For adding an additional values for tags"
  type        = map(string)
  default     = {}
}

# Records

variable "create_records" {
  description = "Whether or not to create record(s)"
  type        = bool
  default     = false
}

variable "record" {
  description = "A list of records to create"
  type        = any
  default     = []
}
