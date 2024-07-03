variable "subscription_id" {
  type        = string
  description = "subscription id"

}

variable "resource_group_name" {
  description = "Resource group name"
  default = "app-grp"
  
}

variable "location" {
  description = "Resource group location"
  default = "westus2"
}

variable "create_vnet" {
  type = bool
  default = false
}

variable "vnetname" {
  type = string
  default = ""
}

variable "no_of_subnets" {
  type = number
  default = 0
}


variable "create-nsg" {
  type        = bool
  description = "Will be used to deploy nsg to the subscriptions"
  default     = false

}

variable "security_rule" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = optional(string)
    destination_port_range     = optional(string)
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default     = {}
}