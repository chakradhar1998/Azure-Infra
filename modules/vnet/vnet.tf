resource "azurerm_virtual_network" "appnetwork" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}