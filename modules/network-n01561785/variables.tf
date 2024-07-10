variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}


variable "location" {
  description = "Azure region where the resources will be created"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_address_space" {
  description = "Address space for the subnet"
  type        = string
}

variable "nsg_name" {
  description = "Name of the network security group"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
}
