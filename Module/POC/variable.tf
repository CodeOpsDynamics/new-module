variable "sa" {
  type        = map(any)
  description = "Used for passing storage name and required attributes"
}

#vnet
variable "vn" {
  default = null
  type = map(object({
    name          = string,
    address_space = list(string)
  }))
}

#vnet-peering
variable "vn2" {}
variable "remote_virtual_network_ids" {}

#Subnet
variable "sb" {}

#nic
variable "sb1" {}

#nsg
variable "nsg" {}

#nsg-nic
variable "nn" {}

#pip
variable "pip" {}

#vm
variable "vm" {}

#bastion
variable "bs" {}

#LB
variable "vm1" {}

#kv
variable "kv" {}