output "resource_group_name" {
  value       = azurerm_resource_group.n01561785-rg.name
  description = "The name of the resource group"
}

output "location" {
  value       = azurerm_resource_group.n01561785-rg.location
  description = "The location/region of the resource group"
}

output "tags" {
  value       = azurerm_resource_group.n01561785-rg.tags
  description = "Tags applied to the resource group"
}
