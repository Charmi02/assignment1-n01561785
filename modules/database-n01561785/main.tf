resource "azurerm_postgresql_server" "postgres_server" {
  name                = var.db_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name = var.sku_name

  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled

  administrator_login          =var.db_admin_username
  administrator_login_password = var.db_admin_password
  version                      = var.db_version
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled

  tags = var.common_tags
}

resource "azurerm_postgresql_database" "postgres_db" {
  name                = var.db_database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.postgres_server.name
  charset             = var.db_charset
  collation           = var.db_collation

}
