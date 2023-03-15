resource "azurerm_resource_group" "Assignment1" {
  name     = "Assignment1"
  location = "East US"
}

resource "azurerm_app_service_plan" "asp1" {
  name                = var.asp-name
  location            = azurerm_resource_group.Assignment1.location
  resource_group_name = azurerm_resource_group.Assignment1.name

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_app_service" "web-app" {
  name                = var.webapp-name
  location            = azurerm_resource_group.Assignment1.location
  resource_group_name = azurerm_resource_group.Assignment1.name
  app_service_plan_id = azurerm_app_service_plan.asp1.id

  site_config {
    dotnet_framework_version = var.dotnetversion
    
      }

}