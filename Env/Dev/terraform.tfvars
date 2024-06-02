
rg = {
  rg1 = {
    name     = "private"
    location = "west Europe"
  }
}

vnet = {
  virtualnet1 = {

    name                = "VnetA"
    address_space       = ["10.0.0.0/16"]
    location            = "west Europe"
    resource_group_name = "private"
  }
}

sub = {

  subnet1 = {
    name                 = "frontend_subnet"
    resource_group_name  = "private"
    virtual_network_name = "VnetA"
    address_prefixes     = ["10.0.1.0/24"]
  }

}

Virtual_machine = {

  VM1 = {

 
    name_nic          = "Networkcard"
    name_vm           = "frontendVM"
    Subnet_name       = "frontend_subnet"
    vnet_name          ="VnetA"
    size              = "Standard_F2"
    rg_name           = "private"
    location          = "West Europe"
    allocation_method = "Static"
    admin_username    = "adminuser"
    admin_password    = "1y^lqs0L5c6C"

  }
}
