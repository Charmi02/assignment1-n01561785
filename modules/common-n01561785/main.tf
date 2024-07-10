resource "azurerm_log_analytics_workspace" "la_workspace" {
  name                = "vm-${var.recovery_services_vault.vault_name}-vault"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace.log_sku
  retention_in_days   = var.log_analytics_workspace.retention

  tags = var.common_tags
}

resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                ="vm-${var.recovery_services_vault.vault_name}-recover"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.recovery_services_vault.vault_sku

  tags = var.common_tags
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.common_tags
}
