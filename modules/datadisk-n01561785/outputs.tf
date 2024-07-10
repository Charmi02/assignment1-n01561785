output "data_disk_ids" {
  value = values(azurerm_managed_disk.data_disk)[*].id
}

output "data_disk_names" {
  value = values(azurerm_managed_disk.data_disk)[*].name
}

output "data_disk_sizes_gb" {
  value = values(azurerm_managed_disk.data_disk)[*].disk_size_gb
}

output "data_disk_types" {
  value = values(azurerm_managed_disk.data_disk)[*].storage_account_type
}

output "data_disk_attachment_luns" {
  value = values(azurerm_virtual_machine_data_disk_attachment.data_disk_attach)[*].lun
}

output "data_disk_attachment_caching" {
  value = values(azurerm_virtual_machine_data_disk_attachment.data_disk_attach)[*].caching
}

output "total_disks_created" {
  value = length(azurerm_managed_disk.data_disk)
}
