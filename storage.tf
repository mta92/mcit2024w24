/*resource "random_string" "storage_account_name" {
  length = 16
  special = false
  upper   = false
}

resource "azurerm_storage_account" "example" {
  name                     = "st-${random_string.storage_account_name.result}"
  # ... rest of the configuration
}*/
