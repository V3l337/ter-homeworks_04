output "vm_marketing_ip" {
  value = module.vm_marketing.external_ip_address
}

output "vm_marketing_fqdn" {
  value = module.vm_marketing.fqdn
}

output "vm_analytics_ip" {
  value = module.vm_analytics.external_ip_address
}

output "vm_analytics_fqdn" {
  value = module.vm_analytics.fqdn
}

output "subnets_info" {
  value = module.vpc_dev.subnets_info
}