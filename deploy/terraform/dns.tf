resource "azurerm_dns_zone" "mgwDNS" {
  name                = var.dns_zone_name
  resource_group_name = azurerm_resource_group.mgwRG.name
}

resource "azurerm_dns_cname_record" "mgwCNAME" {
  name                = var.custom_domain_name
  zone_name           = azurerm_dns_zone.mgwDNS.name
  resource_group_name = azurerm_resource_group.mgwRG.name
  ttl                 = 300
  record              = "${azurerm_storage_account.mgwSTG.name}.z33.web.core.windows.net"
}

megageekwebstgnew1.z33.web.core.windows.net
megageekwebstgnew1.z33.web.core.windows.net
megageekwebstgnew1.z33.web.core.windows.net
megageekwebstgnew1.z33.web.core.windows.net