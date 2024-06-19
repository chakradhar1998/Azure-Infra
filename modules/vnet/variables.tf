variable "resource_group_name" {
  description = "Resource group name"
}

variable "location" {
  description = "Resource group location"
}

variable "vnetname" {
  description = "Virtual network name"
}

variable "address_space" {
  description = "address space for vnet"
  default = "10.0.0.0/16"
}