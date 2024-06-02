module "resource_group" {
  source = "../../Resource_group"

  rg = var.rg


}

module "Vnet" {
  depends_on = [module.resource_group]
  source     = "../../vnet"

  vnet = var.vnet



}

module "subnet" {
  depends_on = [module.Vnet]
  source     = "../../subnet"

  sub = var.sub


}

module "Virtual_machine" {
  depends_on = [module.subnet]
  source     = "../../virtual_machine"

  Virtual_machine = var.Virtual_machine


}

module "Virtual_machine" {
  depends_on = [module.subnet]
  source     = "../../virtual_machine"

  Virtual_machine = var.Virtual_machine


}
