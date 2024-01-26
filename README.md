# Azure authentication with service principle and client secret

Terraform code which creates azure application object in Azure AD, generates a client secret and returns credentials as output. <br>
For more details follow this [link](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/guides/service_principal_client_secret)

```
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="MyCl1eNtSeCr3t"
export ARM_TENANT_ID="10000000-2000-3000-4000-500000000000"
```
