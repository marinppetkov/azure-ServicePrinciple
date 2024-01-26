terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
      version = "2.46.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.89.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {}

data "azurerm_subscription" "current" {}
data "azuread_client_config" "current" {}

resource "azuread_application" "tfc_app_access" {
  display_name = var.azure_application_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "tfc_service_principal" {
  client_id                    = azuread_application.tfc_app_access.client_id
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "azurerm_role_assignment" "tfc_role_assignment" {
  scope                = data.azurerm_subscription.current.id
  principal_id         = azuread_service_principal.tfc_service_principal.object_id
  role_definition_name = var.role_definition
}

resource "azuread_application_password" "client_secrets" {
  application_id = azuread_application.tfc_app_access.id
}
