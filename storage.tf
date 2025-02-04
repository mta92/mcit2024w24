resource "azurerm_storage_account" "mcitmta" {
  name                     = "mtastorage01"
  resource_group_name      = azurerm_resource_group.mcit420zz5um_.name
  location                 = azurerm_resource_group.mcit420zz5um_.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
