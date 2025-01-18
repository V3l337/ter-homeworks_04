variable "network_name" {
  description = "The name of the network"
  type        = string
}

variable "zone" {
  description = "The availability zone for the subnet"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "CIDR block for the subnet"
  type        = string
}
