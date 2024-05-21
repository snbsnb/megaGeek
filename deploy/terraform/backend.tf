terraform {
  backend "azurerm" {
    resource_group_name   = "megaGeekWebState"
    storage_account_name  = "megageekstate"
    container_name        = "terraform"
    key                   = "mgwState"
  }
}