resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_virtual_network" "appnetwork" {
  name                = "app-network"
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnetA"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "subnetB"
    address_prefix = "10.0.1.0/24"
  }
  depends_on = [azurerm_resource_group.appgrp]
}