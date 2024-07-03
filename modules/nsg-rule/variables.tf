variable "resource_group_name" {
  description = "Resource group name"

}


variable "nsg_name" {
  description = "nsg resource name"
}

variable "nsgrule" {
  type = map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}