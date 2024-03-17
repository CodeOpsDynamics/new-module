module "rg" {
  source = "../../RG"
}

module "storage" {
  source     = "../../Storage"
  sa         = var.sa
  depends_on = [module.rg]
}


module "vnet" {
  source     = "../../VNET"
  vn         = var.vn
  depends_on = [module.rg]
}

module "vnet-peering" {
  source                     = "../../Vnet-Peering"
  vn2                        = var.vn2
  remote_virtual_network_ids = var.remote_virtual_network_ids
  depends_on                 = [module.rg, module.vnet]
}

module "sb" {
  source     = "../../Subnet"
  sb         = var.sb
  depends_on = [module.rg, module.vnet, module.vnet-peering]
}

module "nic" {
  source     = "../../NIC"
  sb1        = var.sb1
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb]
}

module "nsg" {
  source     = "../../NSG"
  nsg        = var.nsg
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb]
}

module "nsg-nic" {
  source     = "../../NSG_NIC"
  nn         = var.nn
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb, module.nsg, module.nic]
}

module "pip" {
  source     = "../../PIP"
  pip        = var.pip
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb, module.nsg, module.nic]
}

module "vm" {
  source     = "../../VM"
  vm         = var.vm
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb, module.nsg, module.nic]
}

module "bs" {
  source     = "../../bastion"
  bs         = var.bs
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb]
}

module "srv" {
  source     = "../../DB-Server"
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb, module.nsg]
}

module "db" {
  source     = "../../DB"
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb, module.nsg, module.nic]
}

module "kv" {
  source = "../../KV"
  kv = var.kv
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb, module.nsg, module.nic, module.vm]
}


module "LB" {
  source     = "../../LB"
  vm1        = var.vm1
  depends_on = [module.rg, module.vnet, module.vnet-peering, module.sb, module.nsg, module.nic, module.vm]
}