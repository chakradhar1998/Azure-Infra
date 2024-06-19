module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "basic-network" {
  count = var.create_vnet== true ? 1:0
  source              = "./modules/vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnetname            = var.vnetname
}