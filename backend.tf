terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate2408"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
    subscription_id = "55b24198-da47-4df9-a82d-aa987405a685"
  }
}