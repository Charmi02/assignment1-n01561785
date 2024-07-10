variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  type        = string
  description = "The Azure region where the resources will be created"
}

variable "linux_avs" {
  type        = string
  description = "Name of the Availability Set for Linux VMs"
}

variable "linux_vms" {
  type = map(string)
  default = {
    "1785-u-vm1" = "Standard_B1ms"
    "1785-u-vm2" = "Standard_B1ms"
    "1785-u-vm3" = "Standard_B1ms"
  }
  description = "Map of Linux VMs to create with their properties"
}

variable "linux_vms_username" {
  type        = string
  default     = "n01561785"
  description = "Username for Linux VMs"
}

variable "pub_key" {
  type        = string
  description = "Path to the public SSH key"
}

variable "priv_key" {
  type        = string
  default     = "~/.ssh/id_rsa"
  description = "Path to the private SSH key"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet where VMs will be created"
}

variable "vm_linux_publisher" {
  type        = string
  default     = "OpenLogic"
  description = "Publisher for the Linux VM image"
}

variable "vm_linux_offer" {
  type        = string
  default     = "CentOS"
  description = "Offer for the Linux VM image"
}

variable "vm_linux_sku" {
  type        = string
  default     = "8_2"
  description = "SKU for the Linux VM image"
}

variable "vm_linux_version" {
  type        = string
  default     = "latest"
  description = "Version of the Linux VM image"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to all resources"
}

variable "os_disk_attribute" {
  type = map(string)
  default = {
    os_disk_size              = "32"
    os_storage_account_type   = "Premium_LRS"
    os_disk_caching           = "ReadWrite"
  }
  description = "OS disk attributes for the Linux VMs"
}

variable "storage_account_uri" {
  type        = string
  description = "URI of the storage account for boot diagnostics"
}
