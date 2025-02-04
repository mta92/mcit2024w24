resource "azurerm_storage_account" "mcitmta" {
  name                     = "st-mta20232125"
  resource_group_name      = azurerm_resource_group.mcit_resource_group111.name
  location                 = azurerm_resource_group.mcit_resource_group111.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
