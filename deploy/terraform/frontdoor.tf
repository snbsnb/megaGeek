# NEED TO CREATE:
# route
# Endpoint CDN
# origin
# Origin group 
# frontdoor

# see: https://medium.com/coding-in-the-cloud/cloud-resume-challenge-tutorial-8f4e9277d158



# resource "azurerm_cdn_profile" "mgwCDNPROFILE" {
#   name                = "example-profile"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name
#   sku                 = "Standard_Verizon"
# }

# resource "azurerm_cdn_endpoint" "mgwCDNENDPOINT" {
#   name                = "${var.prefix}-CDN-endpoint"
#   profile_name        = azurerm_cdn_profile.mgwCDNPROFILE.name
#   location            = azurerm_resource_group.mgwRG.location
#   resource_group_name = azurerm_resource_group.mgwRG.name

#   origin {
#     name      = "${var.prefix}-staticweb-endpoint"
#     host_name = azurerm_storage_account.mgwSTG.primary_web_endpoint  # Replace with your storage account's primary endpoint
#   }
# }

# resource "azurerm_cdn_frontdoor_profile" "mgwFDPROFILE" {
#   name                = "${var.prefix}-frontdoor-profile"
#   resource_group_name = azurerm_resource_group.mgwRG.name
#   sku_name            = "Standard_AzureFrontDoor"
# }

# resource "azurerm_dns_cname_record" "example" {
#   name                = "cdn"
#   zone_name           = data.azurerm_dns_zone.example.name
#   resource_group_name = data.azurerm_dns_zone.example.resource_group_name
#   ttl                 = 3600
#   target_resource_id  = azurerm_cdn_endpoint.example.id
# }

# resource "azurerm_cdn_frontdoor_custom_domain" "mgwFD" {
#   name                     = "${var.prefix}-frontdoor-customdomain"
#   cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.mgwFDPROFILE.id
#   dns_zone_id              = azurerm_dns_zone.mgwDNS.id
#   host_name                = azurerm_dns_zone.mgwDNS.name

#   tls {
#     certificate_type    = "ManagedCertificate"
#     minimum_tls_version = "TLS12"
#   }
# }