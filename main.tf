# Создадим ВМ при помощи Terraform

resource "yandex_vpc_network" "v_network" {
  name            = var.vpc_name
}
resource "yandex_vpc_subnet" "v_network" {
  name            = var.vpc_name
  zone            = var.default_zone
  network_id      = yandex_vpc_network.v_network.id
  v4_cidr_blocks  = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family          = var.family_name
}
resource "yandex_compute_instance" "platform_web" {
  name            = var.vm_name
  platform_id     = var.vm_platform_id
  zone            = var.vm_web_zone
  resources {
    cores         = var.vms_resources.vm_resources.cores
    memory        = var.vms_resources.vm_resources.memory
    core_fraction = var.vms_resources.vm_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible   = var.vm_web_hw_preemptible
  }
  network_interface {
    subnet_id     = yandex_vpc_subnet.v_network.id
    nat           = var.vm_web_hw_nat
  }
metadata = var.common_metadata

}

