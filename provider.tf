provider "azurerm" {
  features = {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# Set the Azure Provider source and version being used
terraform {
  required_version = ">= 0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.1.0"
    }
  }
}