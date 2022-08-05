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
variable "tags" {
  description = "Key-value values for tags"
  type        = map(string)
  default     = {}
}

variable "records" {
  description = "A list of records to create"
  type        = any
  default     = []
}
