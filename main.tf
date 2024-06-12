resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location
}

resource "azurerm_virtual_network" "appnetwork" {
  name                = local.virtual_network.name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]
  depends_on          = [azurerm_resource_group.appgrp]
}

resource "azurerm_subnet" "subnetA" {
  name                 = local.subnet[0].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = [local.subnet[0].address_prefix]
}

resource "azurerm_subnet" "subnetB" {
  name                 = local.subnet[1].name
  resource_group_name  = local.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = [local.subnet[1].address_prefix]
}

resource "azurerm_network_interface" "appinterface" {
  name                = "appinterface"
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.appip.id
  }
  depends_on = [azurerm_subnet.subnetA]
}

resource "azurerm_network_interface" "appinterface2" {
  name                = "appinterface2"
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
  }
  depends_on = [ azurerm_subnet.subnetA ]
}

resource "azurerm_public_ip" "appip" {
  name                = "app-ip"
  resource_group_name = local.resource_group_name
  location            = local.location
  allocation_method   = "Dynamic"

  lifecycle {
    create_before_destroy = true
  }
  depends_on = [local.resource_group_name]
}

resource "azurerm_network_security_group" "appnsg" {
  name                = "app-nsg"
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [azurerm_resource_group.appgrp]
}

resource "azurerm_subnet_network_security_group_association" "appnsglink" {
  subnet_id                 = azurerm_subnet.subnetA.id
  network_security_group_id = azurerm_network_security_group.appnsg.id
}

# resource "azurerm_windows_virtual_machine" "appvm" {
#   name                = "appvm"
#   resource_group_name = local.resource_group_name
#   location            = local.location
#   size                = "Standard_D2S_v3"
#   admin_username      = "adminuser"
#   admin_password      = "P@$$w0rd1234!"
#   network_interface_ids = [
#     azurerm_network_interface.appinterface.id,
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "MicrosoftWindowsServer"
#     offer     = "WindowsServer"
#     sku       = "2019-Datacenter"
#     version   = "latest"
#   }
#   depends_on = [ azurerm_network_interface.appinterface ]
# }