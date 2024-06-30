variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "demo-glb-debt-crm-rg"
}

variable "location" {
  description = "The Azure location where resources will be created"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type = string
  default = "glbdebtcrmsa"
}

variable "app_service_plan_id" {
  description = "app service plan name"
  type = string
  default = "glb-debt-crm-asp"
}

variable "function_app_name" {
  description = "Function App Name"
  type = string
  default = "glb-debt-crm-fa"
}

variable "storage_account_access_key" {
  description = "The access key of the storage account"
  type        = string
  default     = "demo-key"
}