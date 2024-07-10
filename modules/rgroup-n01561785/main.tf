resource "azurerm_resource_group" "n01561785-rg" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}
