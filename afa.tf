/*# Create a Storage Account (required for Function App)
resource "azurerm_storage_account" "st" {
  name                     = "tatsamcitstorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS" # Or other replication type as needed

  # Enable Blob storage for the Function App
  blob_properties {
    cors_rule { # Important: Add CORS rules if you plan to access from a browser
      allowed_origins = ["*"] # Or specify your allowed origins
      allowed_methods = ["GET", "POST", "OPTIONS"] # Adjust as necessary
      allowed_headers = ["*"]
      exposed_headers  = ["*"]
      max_age_in_seconds = 3600
    }
  }
}

resource "random_string" "suffix" {
  length = 8
  special = false
  upper   = false
  number  = true
}

# Create the Function App
resource "azurerm_function_app" "func" {
  name                = "tatsamcitfunction"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  storage_account_name = azurerm_storage_account.st.name
  storage_account_access_key = azurerm_storage_account.st.primary_access_key # Important!
  app_service_plan_id = azurerm_app_service_plan.asp.id # Reference the app service plan

  site_config {
    # Other site config settings as required (e.g., cors)
  }
}


# Create an App Service Plan (required for Function App)
resource "azurerm_app_service_plan" "asp" {
  name                = "asp-tatsamcitfunction" # Or a custom name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "Linux" # Or "Windows" if needed
  sku {
    name = "S1" # Or another SKU
    tier = "Standard"
  }
}

# Output the Function App URL
output "function_app_url" {
  value = azurerm_function_app.func.default_site_hostname
}
*/
