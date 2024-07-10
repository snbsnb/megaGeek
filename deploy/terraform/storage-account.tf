resource "azurerm_storage_account" "mgwSTG" {
  name                     = lower("${var.prefix}stgnew1")
  location                 = var.region
  resource_group_name      = azurerm_resource_group.mgwRG.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Hot"

  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }

  depends_on = [azurerm_dns_zone.mgwDNS]
}

resource "azurerm_storage_blob" "index_html" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.mgwSTG.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "../../src/webapp/index.html"

  # lifecycle {
  #   ignore_changes = all
  # }
}

resource "azurerm_storage_blob" "error_html" {
  name                   = "404.html"
  storage_account_name   = azurerm_storage_account.mgwSTG.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "../../src/webapp/404.html"

  # lifecycle {
  #   ignore_changes = all
  # }
}
