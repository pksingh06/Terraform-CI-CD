variable "rg-name" {
  type = string
}
variable "rg-location" {
  type = string
}

variable "vnet-prefix" {
  type = list(string)
}

variable "vnet-address" {
  type = list(string)
}

variable "vnet-peer" {
  type = list(string)
}
