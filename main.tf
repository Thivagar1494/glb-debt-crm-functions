provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "storage_account" {
  source              = "./modules/storage_account"
  depends_on           = [module.resource_group]
  storage_account_name = var.storage_account_name
  resource_group_name  = var.resource_group_name
  location             = var.location
}

module "app_service_plan" {
  source              = "./modules/app_service_plan"
  app_service_plan_name = "glb-debt-crm-asp"
  depends_on           = [module.resource_group]
  resource_group_name  = var.resource_group_name
  location             = var.location
}

module "function_app" {
  source                  = "./modules/function_app"
  function_app_name       = var.function_app_name
  depends_on           = [module.resource_group]
  resource_group_name     = var.resource_group_name
  location                = var.location
  app_service_plan_id     = module.app_service_plan.id
  storage_account_name    = var.storage_account_name
  storage_account_access_key = module.storage_account.primary_access_key
}