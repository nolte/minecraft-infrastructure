variable "minecraft_computing_instance_name" {
  default = "mc-minimal"
}
variable "minecraft_computing_instance_flavour" {
  default = "cx21"
}

variable "minecraft_storage_hot_backup_active" {
  default = true
}

variable "minecraft_computing_instance_labels" {
  type = map(string)
  default = {
    stage   = "dev"
    service = "minecraft"
    state   = "active"
  }
}
