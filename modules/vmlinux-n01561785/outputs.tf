output "vm_hostnames" {
  value = values(azurerm_linux_virtual_machine.linux_vm)[*].name
}

output "vm_domain_names" {
  value = values(azurerm_public_ip.linux_pip)[*].fqdn
}

output "vm_private_ips" {
  value = values(azurerm_network_interface.linux_nic)[*].private_ip_address
}

output "vm_public_ips" {
  value = values(azurerm_linux_virtual_machine.linux_vm)[*].public_ip_address
}

output "linux_vm_ids" {
  value = values(azurerm_linux_virtual_machine.linux_vm)[*].id
}

output "linux_vm_nic_ids" {
  value = values(azurerm_network_interface.linux_nic)[*].id
}

output "network_interface_ip_config_names" {
  value = values(azurerm_network_interface.linux_nic)[*].ip_configuration[0].name
}
