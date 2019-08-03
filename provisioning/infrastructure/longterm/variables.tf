variable "private_access_pass_path" {
  default = "private/keyfiles/ssh/private_ed25519/id_ed25519.pub"
}

variable "machine_access_pass_path" {
  default = "private/keyfiles/ssh/ansible_rollout/id_ed25519.pub"
}
variable "minecraft_storage_hot_backup_size" {
  default = 20
}
variable "minecraft_storage_hot_backup_format" {
  default = "ext4"
}
