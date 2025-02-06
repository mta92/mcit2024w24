# Create the WAF Policy
resource "azurerm_web_application_firewall_policy" "rgmta" {
  name                = "tatsa"  # The name you specified
  resource_group_name = azurerm_resource_group.rgmta.name
  location            = azurerm_resource_group.rgmta.location

  # Define the policy settings (at least one rule set is required)
  policy_settings {
    mode                 = "Prevention" # Or "Detection"
    state                = "Enabled"
    request_body_check   = true # Example setting
    file_upload_limit_mb = 100  # Example setting
  }
}
