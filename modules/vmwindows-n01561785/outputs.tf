output "windows_vm_hostnames" {
  value       = azurerm_windows_virtual_machine.windows_vm[*].name
}

output "windows_vm_domain_names" {
  value       = azurerm_public_ip.windows_pip[*].fqdn
}

output "windows_vm_private_ips" {
  value       = azurerm_network_interface.windows_nic[*].private_ip_address
}

output "windows_vm_public_ips" {
  value       = azurerm_windows_virtual_machine.windows_vm[*].public_ip_address
}

output "windows_vm_ids" {
  value = azurerm_windows_virtual_machine.windows_vm[*].id
}
