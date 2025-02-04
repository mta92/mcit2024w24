# Create the Windows virtual machine
resource "azurerm_windows_virtual_machine" "mta_win_vm" {
  name                  = "mtavm" # 
  resource_group_name   = azurerm_resource_group.rgmta.name
  location              = azurerm_resource_group.rgmta.location
  size                  = "Standard_DS1_v2" 
/*  network_interface_ids = [azurerm_network_interface.example.id]*/

  admin_username = "adminuser" 
  admin_password = "TerraformPass" 

  os_disk {
    name                 = "osdisk1-example-vm"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter" 
    version   = "latest"
  }
