variable "vn" {
  default = null
  type = map(object({
    name          = string,
    address_space = list(string)
  }))
}