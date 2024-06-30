provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "asp" {
  name                = "glb-debt-crm-asp"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}