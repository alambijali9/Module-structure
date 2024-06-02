

# data "azurerm_bastion_host" "bastdata" {
#   for_each = var.bast
#   name                = each.value.bastion_subnet_name
#   resource_group_name = each.value.rg_name
# }