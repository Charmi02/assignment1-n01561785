resource "azurerm_public_ip" "lb_pip" {
  name                = var.lb_pip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.lb_pip_allocation_method
}

resource "azurerm_lb" "assignmentllb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.lb_pip.id
  }

  tags = var.common_tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name            = var.backend_pool_name
  loadbalancer_id = azurerm_lb.assignmentllb.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_pool_association" {
  count                   = length(var.linux_vm_nic_ids)
  network_interface_id    = var.linux_vm_nic_ids[count.index]
  ip_configuration_name   = var.linux_vm_nic_ip_config_names[count.index]
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}
