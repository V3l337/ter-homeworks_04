module "vpc_dev" {
  source   = "/root/ter-homeworks/04/src/modules_vpc"
  vpc_name     = "dev-vpc"
  network_name = var.vpc_name
  subnets = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
    { zone = "ru-central1-b", cidr = "10.0.2.0/24" },
    { zone = "ru-central1-d", cidr = "10.0.3.0/24" }
  ]
}

module "vm_marketing" {
  source       = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name     = var.env_name_m
  network_id   = module.vpc_dev.network_id
  subnet_zones = [module.vpc_dev.subnet_zones[0]]
  subnet_ids   = [module.vpc_dev.subnet_ids[0]]
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
  subnet_zones = [module.vpc_dev.subnet_zones[0]]
  subnet_ids   = [module.vpc_dev.subnet_ids[0]]
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
