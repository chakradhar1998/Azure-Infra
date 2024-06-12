resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "westus2"
}

resource "azurerm_storage_account" "appstore2278370" {
  name                     = "appstore2278370"
  resource_group_name      = azurerm_resource_group.appgrp.name
  location                 = azurerm_resource_group.appgrp.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "StorageV2"
}