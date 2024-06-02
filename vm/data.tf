data "azurerm_subnet" "data" {
    for_each = var.virtual_machine
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}


data "azurerm_key_vault" "vault" {
  name                = "coolvault"
  resource_group_name = "private"
}

data "azurerm_key_vault_secret" "username" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.vault.id
}
data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.vault.id
}