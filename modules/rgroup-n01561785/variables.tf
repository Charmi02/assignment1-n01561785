variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "1785-RG"
}

variable "location" {
  description = "Azure region where the resource group will be created"
  type        = string
  default     = "eastus"  # You can change this default as needed
}

variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)
  default     = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Charmi.Prajapati"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
}
}
