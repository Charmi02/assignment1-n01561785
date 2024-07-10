output "database_instance_name" {
  value = azurerm_postgresql_server.postgres_server.name
}

output "database_instance_fqdn" {
  value = azurerm_postgresql_server.postgres_server.fqdn
}

output "database_instance_id" {
  value = azurerm_postgresql_server.postgres_server.id
}

output "database_name" {
  value = azurerm_postgresql_database.postgres_db.name
}

output "database_server_version" {
  value = azurerm_postgresql_server.postgres_server.version
}

output "database_server_sku" {
  value = azurerm_postgresql_server.postgres_server.sku_name
}

output "database_admin_username" {
  value = azurerm_postgresql_server.postgres_server.administrator_login
}

output "database_server_storage_mb" {
  value = azurerm_postgresql_server.postgres_server.storage_mb
}

output "database_server_public_network_access" {
  value = azurerm_postgresql_server.postgres_server.public_network_access_enabled
}

output "database_server_ssl_enforcement" {
  value = azurerm_postgresql_server.postgres_server.ssl_enforcement_enabled
}

output "database_connection_string" {
  value     = "postgres://${azurerm_postgresql_server.postgres_server.administrator_login}@${azurerm_postgresql_server.postgres_server.name}:${azurerm_postgresql_server.postgres_server.administrator_login_password}@${azurerm_postgresql_server.postgres_server.fqdn}:5432/${azurerm_postgresql_database.postgres_db.name}"
  sensitive = true
}
