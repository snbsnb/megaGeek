variable "prefix" {
  description = "The prefix for the resources."
  type        = string
}

variable "region" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "dns_zone_name" {
  type    = string
  default = "megaGeek.io"
}

variable "custom_domain_name" {
  type    = string
  default = "megaGeek.io"
}
