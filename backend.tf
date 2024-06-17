terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate2408"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}