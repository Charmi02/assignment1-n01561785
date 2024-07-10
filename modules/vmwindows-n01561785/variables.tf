variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be created"
}

variable "vm_count" {
  type        = number
  default     = 1
  description = "Number of Windows VMs to create"
}

variable "vm_name_prefix" {
  type        = string
  default     = "1785-w-vm"
  description = "Prefix for Windows VM names"
}

variable "admin_username" {
  type        = string
  default     = "n01561785"
  description = "Admin username for the Windows VMs"
}

variable "admin_password" {
  type        = string
  default     = "CP@r_12a!" 
  description = "Admin password for the Windows VMs"
  sensitive   = true
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where VMs will be created"
}

variable "storage_account_uri" {
  type        = string
  description = "URI of the storage account for boot diagnostics"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to all resources"
}

variable "os_disk" {
  type = object({
    caching              = string
    storage_account_type = string
  })
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  description = "OS disk configuration for the Windows VMs"
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  description = "Source image reference for the Windows VMs"
}
