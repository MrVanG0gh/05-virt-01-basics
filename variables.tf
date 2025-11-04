
variable "cloud_id" {
  type        = string
  default     = "b1gd0ene28ce38jum5ol"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gh84ji5m46hok29kbf"
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
  type        = string
  default     = "v_network"
  description = "VPC network & subnet name"
}

variable "family_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство устанавливаемой ОС"
}

variable "vm_name" {
  type        = string
  default     = "netology-v_network-platform-web"
  description = "Имя виртуальной машины"
}

variable "vm_platform_id" {
  type = string
  default = "standard-v1"
  description = "ID виртуальной платформы"
}

variable "vm_web_hw_preemptible" {
  type = bool
  default = true
  description = "Прерываемость работы ВМ"
}
variable "vm_web_hw_nat" {
  type = bool
  default = true
  description = "Активировать NAT"
}

variable "vm_web_zone" {
  type = string
  default = "ru-central1-a"
  description = "Рабочая зона"
}

# Ex. 6.1
variable "vms_resources" {
  type = map(map(number))
  description = "Resources combo for VMs"
  default = {
    vm_resources = {
      cores = 2
      memory = 1
      core_fraction = 5
    }
  }
}

# Ex. 6.2

variable "common_metadata" {
     description = "Common meta data"
            type = map(string)
         default = {
           serial-port-enable = "1"
           ssh-keys           = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMnceZd2rCKdINN9bbS0QQ5X4mubdFaheN6XcNHbb+u4"
         }
}