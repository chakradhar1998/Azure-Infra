resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location
}


resource "azurerm_storage_account" "appstore2278370" {
  name                     = "appstore2278370"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  depends_on               = [azurerm_resource_group.appgrp]

}

resource "azurerm_storage_container" "data" {
  for_each              = toset(["data", "files", "documents"])
  name                  = each.key
  storage_account_name  = azurerm_storage_account.appstore2278370.name
  container_access_type = "blob"
  depends_on            = [azurerm_storage_account.appstore2278370]
}