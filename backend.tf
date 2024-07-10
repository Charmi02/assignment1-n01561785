terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01561785RG"
    storage_account_name = "tfstaten01561785sa"
    container_name       = "tfstatefiles"
    key                  = "tfstate"
  }
}
