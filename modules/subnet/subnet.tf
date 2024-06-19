resource "azurerm_subnet" "subnets" {
  name                 = var.subnetname
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnetname
  address_prefixes     = var.address_prefix
}
