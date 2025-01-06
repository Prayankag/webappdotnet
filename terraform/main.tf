# terraform/main.tf
# Reference the existing resource group
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}
provider "azurerm" {
  features {}
  
}

# Use environment-specific values dynamically
module "webapp" {
  source              = "./modules/webapp"
  web_app_name            = var.web_app_name
  environment         = var.environment
  resource_group_name      = data.azurerm_resource_group.example.name
  location                 = data.azurerm_resource_group.example.location 
  app_service_plan_name = var.app_service_plan_name
}

