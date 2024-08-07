module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "basic-network" {
  count               = var.create_vnet == true ? 1 : 0
  source              = "./modules/vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnetname            = var.vnetname
  depends_on          = [module.rg]
}

module "subnets" {
  count               = var.no_of_subnets
  source              = "./modules/subnet"
  resource_group_name = var.resource_group_name
  vnetname            = var.vnetname
  subnetname          = "subnet${count.index}"
  address_prefix      = ["10.0.${count.index}.0/24"]
  depends_on          = [module.basic-network]
}

module "nsgs" {
  count               = var.create-nsg == true ? 1 : 0
  source              = "./modules/nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
  nsg_name            = var.nsg_name
  depends_on          = [module.rg]

}

module "nsgrule" {
  count               = var.create-nsg == true ? 1 : 0
  source              = "./modules/nsg-rule"
  nsg_name            = var.nsg_name
  resource_group_name = var.resource_group_name
  nsgrule             = var.security_rule
  depends_on          = [module.nsgs]
}