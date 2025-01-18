module "vpc_dev" {
  source         = "/root/ter-homeworks/04/src/modules_vpc"
  network_name   = var.vpc_name
  zone           = var.default_zone
  v4_cidr_blocks = var.default_cidr[0]
}

module "vm_marketing" {
  source       = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name     = var.env_name_m
  network_id   = module.vpc_dev.network_id
  subnet_zones = [var.default_zone]
  subnet_ids   = [module.vpc_dev.subnet_id]
  #instance_name = var.vm_marketing
  image_family = data.yandex_compute_image.deb.family
  public_ip    = true

  labels = {
    owner   = "marketing"
    project = "marketing"
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }

}

module "vm_analytics" {
  source       = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name     = var.env_name_a
  network_id   = module.vpc_dev.network_id
  subnet_zones = [var.default_zone]
  subnet_ids   = [module.vpc_dev.subnet_id]
  #instance_name = var.vm_analytics
  image_family = data.yandex_compute_image.deb.family
  public_ip    = true

  labels = {
    owner   = "analytics"
    project = "analytics"
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }

}
