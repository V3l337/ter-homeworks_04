variable "network_name" {
  description = "The name of the network"
  type        = string
}

variable "vpc_name" {
  description = "VPC network and subnet name"
  type        = string
}

variable "subnets" {
  description = "Список подсетей с указанием зоны и CIDR"
  type = list(object({
    zone = string
    cidr = string
  }))
}
