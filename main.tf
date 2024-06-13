resource "azurerm_resource_group" "appgrp" {
  name     = local.resource_group_name
  location = local.location
}


resource "azurerm_storage_account" "appstore2278370" {
  count = 3
  name                     = "${count.index}appstore2278370"
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
  depends_on = [ azurerm_resource_group.appgrp ]

}