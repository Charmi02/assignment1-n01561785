variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be created"
}

variable "db_name" {
  type        = string
  default     = "1785-postgres-server"
  description = "Name of the PostgreSQL server"
}

variable "sku_name" {
  type        = string
  default     = "B_Gen5_2"
  description = "SKU name for the PostgreSQL server"
}

variable "storage_mb" {
  type        = number
  default     = 5120
  description = "Storage size in MB for the PostgreSQL server"
}

variable "backup_retention_days" {
  type        = number
  default     = 7
  description = "Backup retention days for the PostgreSQL server"
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  default     = false
  description = "Enable geo-redundant backups for the PostgreSQL server"
}

variable "auto_grow_enabled" {
  type        = bool
  default     = true
  description = "Enable auto-grow for the PostgreSQL server"
}

variable "db_admin_username" {
  type        = string
  default     = "n01561785admin"
  description = "Administrator username for PostgreSQL server"
}

variable "db_admin_password" {
  type        = string
  default     = "Pr@_178-cha"
  description = "Administrator password for PostgreSQL server"
}

variable "db_version" {
  type        = string
  default     = "11"
  description = "Version of PostgreSQL"
}

variable "ssl_enforcement_enabled" {
  type        = bool
  default     = true
  description = "Enable SSL enforcement for the PostgreSQL server"
}

variable "db_database_name" {
  type        = string
  default     = "n01561785db"
  description = "Name of the PostgreSQL database"
}

variable "db_charset" {
  type        = string
  default     = "UTF8"
  description = "Charset for the PostgreSQL database"
}

variable "db_collation" {
  type        = string
  default     = "English_United States.1252"
  description = "Collation for the PostgreSQL database"
}

variable "common_tags" {
  type        = map(string)
  default     = {}
  description = "Common tags to be applied to all resources"
}
