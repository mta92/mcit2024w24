resource "azurerm_storage_account" "mcitmta" {
  name                     = "st-mta20232125"
  resource_group_name      = azurerm_resource_group.example.name
}
