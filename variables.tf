###cloud vars
# variable "token" {
#   type        = string
#   description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
# }

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  description = "VPC network and subnet name"
  type        = string
}

###ссш ключ file

variable "vms_ssh_root_key" {
  type        = string
  default     = "/root/ter-homeworks/04/src/sskey.pub"
  description = "ssh-keygen -t ed25519"
}

###передача ключа в функцию ${ssh_key} in cloud-init

data "template_file" "cloudinit" {
  template = file("/root/ter-homeworks/04/src/cloud-init.yml")

  vars = {
    ssh_key = file(var.vms_ssh_root_key)
  }
}

###именя тачек

variable "vm_marketing" {
  type        = string
  default     = "netology-"
}

variable "vm_analytics" {
  type        = string
  default     = "netology-"
}

###образ тачки

data "yandex_compute_image" "deb" {
  family = "debian-11"
}

###переменные для окружения тачек

variable "env_name_a" {
  type        = string
  default     = "vm-analytic"
}

variable "env_name_m" {
  type        = string
  default     = "vm-marketing"
}
