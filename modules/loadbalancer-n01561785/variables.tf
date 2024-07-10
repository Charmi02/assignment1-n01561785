variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "linux_vm_nic_ids" {
  type = list(string)
}

variable "common_tags" {
  type = map(string)
}

variable "lb_pip_name" {
  type    = string
  default = "1785-lb-pip"
}

variable "lb_pip_allocation_method" {
  type    = string
  default = "Static"
}

variable "lb_name" {
  type    = string
  default = "1785-lb"
}

variable "frontend_ip_configuration_name" {
  type    = string
  default = "PublicIPAddress"
}

variable "backend_pool_name" {
  type    = string
  default = "1785-backend-pool"
}

variable "linux_vm_nic_ip_config_names" {
  type        = list(string)
}
