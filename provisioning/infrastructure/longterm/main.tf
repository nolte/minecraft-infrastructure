module "private_access_key" {
  source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//modules/project_access_elements?ref=v0.0.6"

  name      = "private_access"
  pass_path = var.private_access_pass_path
  labels = {
    usage = "manual"
  }
}

module "management_access_key" {
  source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//modules/project_access_elements?ref=v0.0.6"

  name      = "management_key"
  pass_path = var.machine_access_pass_path
  labels = {
    usage = "machine"
  }
}
module "minecraft_storage_hot_backup" {
  source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//modules/storage_elements?ref=v0.0.6"

  storage_name   = "volume_mc_data"
  storage_format = var.minecraft_storage_hot_backup_format
  storage_size   = var.minecraft_storage_hot_backup_size
  storage_labels = {
    service = "minecraft-server"
    type    = "hotstorage"
  }
}
