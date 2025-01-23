terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.8.4"
}

resource "yandex_vpc_network" "network" {
  name = var.network_name
}


resource "yandex_vpc_subnet" "subnet" {
  for_each = { for subnet in var.subnets : subnet.cidr => subnet }

  name           = "${var.vpc_name}-${each.value.zone}"
  zone           = each.value.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = [each.key]
}
