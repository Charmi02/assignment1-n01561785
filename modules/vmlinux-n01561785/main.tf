resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  resource_group_name          = var.resource_group_name
  location                     = var.location
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = var.common_tags
}

resource "azurerm_public_ip" "linux_pip" {
  for_each            = var.linux_vms
  name                = "${each.key}-pip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  domain_name_label   = "vm-${each.key}"
  tags                = var.common_tags
}

resource "azurerm_network_interface" "linux_nic" {
  for_each            = var.linux_vms
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.common_tags

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each              = var.linux_vms
  name                  = each.key
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = each.value
  admin_username        = var.linux_vms_username
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  availability_set_id   = azurerm_availability_set.linux_avs.id
  tags                  = var.common_tags

  admin_ssh_key {
    username   = var.linux_vms_username
    public_key = file(var.pub_key)
  }

  os_disk {
    caching              = var.os_disk_attribute["os_disk_caching"]
    storage_account_type = var.os_disk_attribute["os_storage_account_type"]
    disk_size_gb         = var.os_disk_attribute["os_disk_size"]
  }

  source_image_reference {
    publisher = var.vm_linux_publisher
    offer     = var.vm_linux_offer
    sku       = var.vm_linux_sku
    version   = var.vm_linux_version
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each                   = var.linux_vms
  name                       = "NetworkWatcherAgentLinux"
  virtual_machine_id         = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  tags                       = var.common_tags
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each                   = var.linux_vms
  name                       = "AzureMonitorLinuxAgent"
  virtual_machine_id         = azurerm_linux_virtual_machine.linux_vm[each.key].id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
  tags                       = var.common_tags
}
