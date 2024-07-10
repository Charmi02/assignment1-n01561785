variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be created"
  type        = string
}

variable "log_analytics_workspace" {
  description = "Log Analytics Workspace configuration"
  type = object({
    law_name  = string
    log_sku   = string
    retention = number
  })
  default = {
    law_name  = "1785-log-workspace"
    log_sku   = "PerGB2018"
    retention = 30
  }
}

variable "recovery_services_vault" {
  description = "Recovery Services Vault configuration"
  type = object({
    vault_name = string
    vault_sku  = string
  })
  default = {
    vault_name = "1785"
    vault_sku  = "Standard"
  }
}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
  default     = "1785sa"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type        = map(string)
}
