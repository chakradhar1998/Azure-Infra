resource "azurerm_network_security_group" "appnsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}
