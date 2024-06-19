resource "azurerm_virtual_network" "appnetwork" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnets" {
  name                 = var.subnetname
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnetname
  address_prefixes     = var.address_prefix
  depends_on           = [azurerm_virtual_network.appnetwork]
}
