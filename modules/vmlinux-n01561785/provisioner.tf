resource "null_resource" "display_hostnames" {
  for_each = var.linux_vms

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]

    connection {
      type        = "ssh"
      user        = var.linux_vms_username
      private_key = file(var.priv_key)
      host        = azurerm_linux_virtual_machine.linux_vm[each.key].public_ip_address
      timeout     = "2m"
    }
  }

  depends_on = [
    azurerm_linux_virtual_machine.linux_vm,
    azurerm_virtual_machine_extension.network_watcher,
    azurerm_virtual_machine_extension.azure_monitor
  ]
}
