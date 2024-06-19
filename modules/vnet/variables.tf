variable "resource_group_name" {
  type = string
  description = "Resource group name"
}

variable "location" {
  type = string
  description = "Resource group location"
}

variable "vnetname" {
  type = string
  description = "Virtual network name"
  default = ""
}

variable "address_space" {
  type = list(string)
  description = "address space for vnet"
  default = ["10.0.0.0/16"]
}