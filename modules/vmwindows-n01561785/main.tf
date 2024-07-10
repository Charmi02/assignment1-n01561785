resource "azurerm_availability_set" "windows_avs" {
  name                         = "windows-avs"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  tags                         = var.common_tags
}

resource "azurerm_public_ip" "windows_pip" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-pip-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "vm-${var.vm_name_prefix}-${count.index + 1}"
  tags                = var.common_tags
}

resource "azurerm_network_interface" "windows_nic" {
  count               = var.vm_count
  name                = "${var.vm_name_prefix}-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.common_tags

  ip_configuration {
    name                          = "${var.vm_name_prefix}-ipconfig-${count.index + 1}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count                 = var.vm_count
  name                  = "${var.vm_name_prefix}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = "Standard_B1s"
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  availability_set_id   = azurerm_availability_set.windows_avs.id
  network_interface_ids = [azurerm_network_interface.windows_nic[count.index].id]
  tags                  = var.common_tags

  os_disk {
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  count                      = var.vm_count
  name                       = "IaaSAntimalware"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows_vm[count.index].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.3"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "AntimalwareEnabled": true,
        "RealtimeProtectionEnabled": true,
        "ScheduledScanSettings": {
            "isEnabled": true,
            "day": "7",
            "time": "120",
            "scanType": "Quick"
        },
        "Exclusions": {
            "Extensions": "",
            "Paths": "",
            "Processes": ""
        }
    }
SETTINGS

  tags = var.common_tags
}
