resource "azurerm_application_insights" "app_insights" {
  name                = var.application_insights.name
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name

  # Valid values are "ios" for iOS, "java" for Java web, 
  # "MobileCenter" for App Center, "Node.JS" for Node.js, 
  # "other" for General, "phone" for Windows Phone, "store" for Windows Store and "web" for ASP.NET. 
  application_type    = var.application_insights.application_type
}