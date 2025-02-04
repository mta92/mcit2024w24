resource "azurerm_storage_account" "mcitmta" {
  name                     = "st-mta20232125"
  resource_group_name      = mcit_resource_group_w24_
  location                 = "canadacentral"
  account_tier             = "Standard"
}
