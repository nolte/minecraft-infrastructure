module "private_access_key" {
  source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//project_access_elements?ref=v0.0.5"

  name      = "private_access"
  pass_path = var.private_access_pass_path
  labels = {
    usage = "manual"
  }
}

module "management_access_key" {
  source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//project_access_elements?ref=v0.0.5"

  name      = "management_key"
  pass_path = var.machine_access_pass_path
  labels = {
    usage = "machine"
  }
}
module "minecraft_storage_hot_backup" {
  source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//storage_elements?ref=v0.0.5"

  storage_name   = "volume_mc_data"
  storage_format = var.minecraft_storage_hot_backup_format
  storage_size   = var.minecraft_storage_hot_backup_size
  storage_labels = {
    service = "minecraft-server"
    type    = "hotstorage"
  }
}
