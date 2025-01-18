output "network_id" {
  description = "The ID of the created VPC network"
  value       = yandex_vpc_network.network.id
}

output "subnet_id" {
  description = "The ID of the created subnet"
  value       = yandex_vpc_subnet.subnet.id
}

output "subnet_name" {
  description = "The name of the created subnet"
  value       = yandex_vpc_subnet.subnet.name
}