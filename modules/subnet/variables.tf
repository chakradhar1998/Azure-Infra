variable "resource_group_name" {
  description = "Resource group name"
  
}

variable "location" {
  type = string
  description = "Resource group location"
}

variable "vnetname" {
  description = "Virtual network name"
}

variable "subnetname" {
  description = "The subnet name to be used"
}

variable "address_prefix" {
  description = "Address prefix of the subnet"
  type = list(string)
}