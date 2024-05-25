terraform {
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = ${{ secrets.ARM_SA }}
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}