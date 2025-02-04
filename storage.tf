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

# Create a virtual network
resource "azurerm_virtual_network" "rgmta" {
  name                = "vnet-rgmta-linux-vm"
  resource_group_name = azurerm_resource_group.rgmta.name
  location            = azurerm_resource_group.rgmta.location
  address_space       = ["10.0.0.0/16"]
}

# Create a subnet
resource "azurerm_subnet" "rgmta" {
  name                 = "subnet-rgmta-linux-vm"
  resource_group_name  = azurerm_resource_group.rgmta.name
  virtual_network_name = azurerm_virtual_network.rgmta.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a public IP address (optional, but recommended for SSH access)
resource "azurerm_public_ip" "rgmta" {
  name                = "pip-rgmta-linux-vm"
  resource_group_name = azurerm_resource_group.rgmta.name
  location            = azurerm_resource_group.rgmta.location
  allocation_method   = "Dynamic" # Or "Static"
}

# Create a network interface
resource "azurerm_network_interface" "rgmta" {
  name                = "nic-rgmta-linux-vm"
  location            = azurerm_resource_group.rgmta.location
  resource_group_name = azurerm_resource_group.rgmta.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.rgmta.id
    private_ip_address_allocation = "Dynamic"  # Or "Static"
    public_ip_address_id = azurerm_public_ip.rgmta.id # Associate the public IP
  }
}

# Create the Linux virtual machine
resource "azurerm_linux_virtual_machine" "rgmta" {
  name                  = "vm-rgmta-linux" # Make sure this is unique
  resource_group_name   = azurerm_resource_group.rgmta.name
  location              = azurerm_resource_group.rgmta.location
  size                  = "Standard_DS1_v2" # Choose an appropriate VM size
  network_interface_ids = [azurerm_network_interface.rgmta.id]

  admin_username = "adminuser" # Replace with a strong username

  # SSH Key Authentication (Recommended):
  admin_ssh_public_keys {
    username = "adminuser" # Same as admin_username
    key_data = file("~/.ssh/id_rsa.pub") # Replace with your public SSH key file path
  }

  os_disk {
    name                 = "osdisk1-rgmta-linux-vm"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS" # Or "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical" # rgmta: Ubuntu
    offer     = "0001-Server"
    sku       = "UbuntuServer"
    version   = "latest"   # Or a specific version (recommended for production)
  }

  # Optional: Add data disks if needed (see previous rgmta)
}

# Output the public IP address (if you created one)
output "public_ip_address" {
  value = azurerm_public_ip.rgmta.ip_address
}
