resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

module "vm_marketing" {
  source        = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name      = var.env_name_m
  network_id    = yandex_vpc_network.develop.id
  subnet_zones  = [var.default_zone]
  subnet_ids    = [yandex_vpc_subnet.develop.id]
  #instance_name = var.vm_marketing
  image_family      = data.yandex_compute_image.deb.family
  public_ip     = true

  labels = {
    owner   = "marketing"
    project = "marketing"
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }

}

module "vm_analytics" {
  source        = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name      = var.env_name_a
  network_id    = yandex_vpc_network.develop.id
  subnet_zones  = [var.default_zone]
  subnet_ids    = [yandex_vpc_subnet.develop.id]
  #instance_name = var.vm_analytics
  image_family  = data.yandex_compute_image.deb.family
  public_ip     = true

  labels = {
    owner   = "analytics"
    project = "analytics"
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }

}
