subscription_id = "62c3872c-6679-48dc-8f52-a023c76c87b4"
create_vnet = true
vnetname = "app-network"
no_of_subnets  = 3
create-nsg         = true
# number_of_machines = 1
security_rule = {
    name                       = "test123"
    priority                   = "100"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
}