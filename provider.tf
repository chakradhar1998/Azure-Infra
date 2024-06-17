# Provider block is first configured when writing any tf code.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.107.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "55b24198-da47-4df9-a82d-aa987405a685"
  features {}
}