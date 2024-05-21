resource "azurerm_resource_group" "mgwRG" {
  name     = "${var.prefix}-rg"
  location = var.region
}