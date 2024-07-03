resource "azurerm_network_security_group" "appnsg" {
  name                = "app-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  for_each            = var.security_rule

  security_rule {
    name                       = each.value.name
    priority                   = each.value.priority
    direction                  = each.value.direction
    access                     = each.value.access
    protocol                   = each.value.protocol
    source_port_range          = each.value.source_port_range
    destination_port_range     = each.value.destination_port_range
    source_address_prefix      = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
  }
}

# resource "azurerm_subnet_network_security_group_association" "appnsglink" {
#   count                     = var.number_of_subnets
#   subnet_id                 = azurerm_subnet.subnets[count.index].id
#   network_security_group_id = azurerm_network_security_group.appnsg[0].id
#   depends_on                = [azurerm_virtual_network.appnetwork, azurerm_network_security_group.appnsg]
# }