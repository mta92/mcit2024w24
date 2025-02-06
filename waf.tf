# Create the WAF Policy
resource "azurerm_web_application_firewall_policy" "rgmta" {
  name                = "tatsa"  # The name you specified
  resource_group_name = azurerm_resource_group.rgmta.name
  location            = azurerm_resource_group.rgmta.location
}
