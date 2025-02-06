/*# Create the WAF Policy
resource "azurerm_web_application_firewall_policy" "waf_policy" {
  name                = "tatsa"  # The name you specified
  resource_group_name = azurerm_resource_group.rgmta.name
  location            = azurerm_resource_group.rgmta.location

# Define the policy settings (at least one rule set is required)
  policy_settings {
    mode                 = "Detection" 
    state                = "Enabled"
    request_body_check   = true # Example setting
    file_upload_limit_mb = 100  # Example setting
  }

  # Add managed rule sets (required) -  Use the appropriate rule set type/version
  managed_rule_set {
    type    = "OWASP"
    version = "3.2"  # Or a compatible version. Ensure this matches below
  }

}
# Output the WAF policy ID (for reference)
output "waf_policy_id" {
  value = azurerm_web_application_firewall_policy.waf_policy.id
}*/
