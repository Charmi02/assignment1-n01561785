resource "azurerm_managed_disk" "data_disk" {
  for_each             = var.vm_ids
  name                 = "${each.key}-data-disk"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  tags                 = var.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
  for_each           = var.vm_ids
  virtual_machine_id = each.value
  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  lun                = var.lun
  caching            = var.caching
}
