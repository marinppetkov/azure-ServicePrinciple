output "client_secret_id" {
  value = azuread_application_password.client_secrets.key_id
}

output "client_value" {
  value =  azuread_application_password.client_secrets.value
  sensitive = true
}

output "subscription_id" {
  description = "Azure subscription ID"
  value       = data.azurerm_subscription.current.subscription_id
}

output "tenant_id" {
  description = "Azure tenant ID"
  value       = data.azurerm_subscription.current.tenant_id
}