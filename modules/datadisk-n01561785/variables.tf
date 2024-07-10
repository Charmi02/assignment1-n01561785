variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be created"
}

variable "vm_ids" {
  type        = map(string)
  description = "Map of VM names to their IDs"
}

variable "common_tags" {
  type        = map(string)
  description = "Common tags to be applied to all resources"
}

variable "storage_account_type" {
  type        = string
  default     = "Standard_LRS"
  description = "Storage account type for the data disks"
}

variable "create_option" {
  type        = string
  default     = "Empty"
  description = "Create option for the data disks"
}

variable "disk_size_gb" {
  type        = number
  default     = 10
  description = "Size of the data disks in GB"
}

variable "lun" {
  type        = number
  default     = 0
  description = "LUN (Logical Unit Number) for the data disk attachment"
}

variable "caching" {
  type        = string
  default     = "ReadWrite"
  description = "Caching option for the data disk attachment"
}
