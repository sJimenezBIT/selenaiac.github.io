resource "azurerm_network_interface" "network_interface_id" {
  name                = var.net_interface.name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location

  ip_configuration {
    name                          = var.net_interface.ip_configuration_name
    subnet_id                     = var.net_interface.subnet_id
    private_ip_address_allocation = "Dynamic"

    # Definition: private_ip_address_allocation
    # Dynamic means "An IP is automatically assigned during creation of this Network Interface"; 
    # Static means "User supplied IP address will be used"

  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm.vm_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  size                = var.vm.vm_size
  admin_username      = var.vm.admin_username
  disable_password_authentication = true

  network_interface_ids = [
    azurerm_network_interface.network_interface_id.id
  ]

  os_disk {
    caching              = var.vm.os_disk_caching   # None, ReadOnly and ReadWrite
    storage_account_type = var.vm.os_disk_storage_account_type
  }
}