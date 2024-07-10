output "log_analytics_workspace_name" {
  value       = azurerm_log_analytics_workspace.la_workspace.name
  description = "The name of the Log Analytics Workspace"
}

output "recovery_services_vault_name" {
  value       = azurerm_recovery_services_vault.recovery_vault.name
  description = "The name of the Recovery Services Vault"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "The name of the Storage Account"
}

output "storage_account_blob_endpoint" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
  description = "The primary blob endpoint for the storage account, used for VM boot diagnostics."
}
