resource "azurerm_storage_account" "mgwSTG" {
  name                     = lower("${var.prefix}stg")
  location                 = var.region
  resource_group_name      = azurerm_resource_group.mgwRG.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"

  static_website {
    index_document = "index.html"
    error_404_document = "404.html"
  }
}

resource "azurerm_storage_container" "static_content" {
  name                  = "static-content"
  storage_account_name  = azurerm_storage_account.mgwSTG.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "index_html" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.mgwSTG.name
  storage_container_name = azurerm_storage_container.static_content.name
  type                   = "Block"
  source                 = "../../src/webapp/index.html"

  lifecycle {
    ignore_changes = all
  }
}

resource "azurerm_storage_blob" "error_html" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.mgwSTG.name
  storage_container_name = azurerm_storage_container.static_content.name
  type                   = "Block"
  source                 = "../../src/webapp/404.html"

  lifecycle {
    ignore_changes = all
  }
}