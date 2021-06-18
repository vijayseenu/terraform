variable "region" {
  default = "us-west-2"
}

variable "tags" {
  type    = list(any)
  default = ["Dev", "Prod"]
}

variable "sg_ports" {
  type = list(number)
  default = ["8200","8201","8202"]
}
