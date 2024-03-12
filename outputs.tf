# output "ARM_CLIENT_SECRET" {
#   value = azuread_application_password.client_secrets.key_id
# }

output "ARM_CLIENT_SECRET" {
  value =  azuread_application_password.client_secrets.value
  sensitive = true
}

output "ARM_SUBSCRIPTION_ID" {
  description = "Azure subscription ID"
  value       = data.azurerm_subscription.current.subscription_id
}

output "ARM_TENANT_ID" {
  description = "Azure tenant ID"
  value       = data.azurerm_subscription.current.tenant_id
}

output "ARM_CLIENT_ID" {
  description = "ARM_CLIENT_ID"
  value = azuread_application.tfc_app_access.client_id

}

# terraform output ARM_CLIENT_SECRET