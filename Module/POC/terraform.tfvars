#storage
sa = {
  "sa1" = {
    name   = "terrasa13tier"
    caname = "statefile"
  }
}

#vnet
vn = {
  "vn1" = {
    name          = "terravnet1"
    address_space = ["10.0.0.0/16"]
  }
  "vn2" = {
    name          = "terravnet2"
    address_space = ["20.0.0.0/16"]
  }
}

#Subnet
sb = {
  "vn1" = {
    name             = "sb1"
    vname            = "terravnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
  "vn2" = {
    name             = "sb2"
    vname            = "terravnet1"
    address_prefixes = ["10.0.2.0/24"]
  }
  "vn3" = {
    name             = "AzureBastionSubnet"
    vname            = "terravnet2"
    address_prefixes = ["20.0.1.0/26"]
  }
}

#vnet-peering
vn2 = {
  "vn1" = {
    name = "terravnet1"
  }
  "vn2" = {
    name = "terravnet2"
  }
}


remote_virtual_network_ids = {
  "vn1" = {
    id = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/virtualNetworks/terravnet2"
  }
  "vn2" = {
    id = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/virtualNetworks/terravnet1"
  }
}

#nic
sb1 = {
  "vn1" = {
    name             = "sb1"
    vname            = "terravnet1"
    address_prefixes = ["10.0.1.0/24"]
    nn               = "n1"
  }
  "vn2" = {
    name             = "sb2"
    vname            = "terravnet1"
    address_prefixes = ["10.0.2.0/24"]
    nn               = "n2"
  }
}

#nsg
nsg = {
  "nsg1" = {
    name = "nsg1"
  }
  "nsg2" = {
    name = "nsg2"
  }
}

#nsg-nic
nn = {
  "nn1" = {
    nic = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/networkInterfaces/n1"
    nsg = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/networkSecurityGroups/nsg1"
  }
  "nn2" = {
    nic = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/networkInterfaces/n2"
    nsg = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/networkSecurityGroups/nsg2"
  }
}

#pip
pip = {
  "pip1" = {
    name = "terrapip1"
  }
  "pip2" = {
    name = "terrapip2"
  }
}

#vm
vm = {
  "vm1" = {
    name = "terravm1"
    id   = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/networkInterfaces/n1"
  }
  "vm2" = {
    name = "terravm2"
    id   = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/networkInterfaces/n2"
  }
}

#bastion
bs = {
  "bs1" = {
    name  = "terrabs1"
    sbid  = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/virtualNetworks/terravnet2/subnets/AzureBastionSubnet"
    pipid = "/subscriptions/fe38ffbb-18f3-41c5-9a63-a1ad7bd1ecfd/resourceGroups/TerraRG1/providers/Microsoft.Network/publicIPAddresses/terrapip1"
  }
}

#LB
vm1 = {
  "vm1" = {
    name = "terravm1"
  }
  "vm2" = {
    name = "terravm2"
  }
}

#kv
kv = "terrakv1"