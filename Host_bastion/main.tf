

resource "azurerm_subnet" "bassubnet" {
   
    for_each = var.bast
  name                 = "AzureBastionSubnet"
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes
}

resource "azurerm_public_ip" "baspip" {
    for_each = var.bast
  name                = each.value.baspip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "example" {
    for_each = var.bast

  name                = each.value.bashost_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = "abcdef"
    subnet_id            = azurerm_subnet.bassubnet[each.key].id
    public_ip_address_id = azurerm_public_ip.baspip[each.key].id
  }
}
