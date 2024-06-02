data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "key" {
  name                        = "coolvault"
  location                    = "West Europe"
  resource_group_name         = "private"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = false
  # enable_rbac_authorization = true

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
      "Set",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}


resource "azurerm_key_vault_secret" "username" {
  name         = "username"
  value        = "adminuser"
  key_vault_id = azurerm_key_vault.key.id
}
resource "azurerm_key_vault_secret" "password" {
  name         = "password"
  value        = "1y^lqs0L5c6C"
  key_vault_id = azurerm_key_vault.key.id
}