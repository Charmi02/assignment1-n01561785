output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}

output "subnet_address_prefix" {
  value = azurerm_subnet.subnet.address_prefixes[0]
}

output "subnet_id" {
  value = azurerm_subnet.subnet.id
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}
