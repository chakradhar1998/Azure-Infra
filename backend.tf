terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = var.storage_account_name
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}