output "network_id" {
  value = yandex_vpc_network.network.id
}

output "subnet_ids" {
  value = [for subnet in yandex_vpc_subnet.subnet : subnet.id]
}

output "subnet_names" {
  value = [for subnet in yandex_vpc_subnet.subnet : subnet.name]
}

output "subnet_zones" {
  value = [for subnet in var.subnets : subnet.zone]
}

output "subnets_info" {
  value = [
    for subnet in yandex_vpc_subnet.subnet :
    {
      name = subnet.name,
      id   = subnet.id,
    }
  ]
}