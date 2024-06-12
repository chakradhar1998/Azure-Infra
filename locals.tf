locals {
  resource_group_name = "app-grp"
  location            = "westus2"
  virtual_network = {
    name          = "app-network"
    address_space = "10.0.0.0/16"
  }
  subnet = [
    {
      name           = "subnetA"
      address_prefix = "10.0.0.0/24"
    },
    {
      name           = "subnetB"
      address_prefix = "10.0.1.0/24"
    }
  ]
}