data "hcloud_volume" "minecraft_hot_storage_backup_runtime" {
  with_selector = "service==minecraft-server,type=hotstorage"
}

data "hcloud_ssh_key" "machine_key" {
  with_selector = "usage=machine"
}

data "hcloud_ssh_key" "private_key" {
  with_selector = "usage=manual"
}


data "template_file" "cloudinit_mounts" {
  template = file("${path.module}/cloudinit_templates/cloudinit mounts.yml.tp")

  vars = {
    hot_backup_storage_active    = "${var.minecraft_storage_hot_backup_active}"
    hot_backup_storage_device_id = "${data.hcloud_volume.minecraft_hot_storage_backup_runtime.linux_device}"
    hot_backup_storage_path      = "/mnt/hotstoarge"
    hot_backup_storage_type      = "ext4"
  }
}


module "minecraft_computing_elements" {
  source = "git::https://github.com/nolte/terraform-infrastructure-modules.git//computing_elements?ref=v0.0.4"

  computing_instance_name                          = var.minecraft_computing_instance_name
  computing_instance_usage_root_key                = data.hcloud_ssh_key.machine_key.id
  computing_instance_labels                        = var.minecraft_computing_instance_labels
  computing_instance_ssh_machine_key_id_var        = data.hcloud_ssh_key.machine_key.public_key
  computing_instance_ssh_private_key_id_var        = data.hcloud_ssh_key.private_key.public_key
  computing_instance_additional_volumes_cloud_init = data.template_file.cloudinit_mounts.rendered
  computing_instance_flavour                       = var.minecraft_computing_instance_flavour
}



resource "hcloud_volume_attachment" "minecraft_computing_volume_runtime" {
  count     = var.minecraft_storage_hot_backup_active == true ? 1 : 0
  volume_id = data.hcloud_volume.minecraft_hot_storage_backup_runtime.id
  server_id = module.minecraft_computing_elements.computing_instance_id
  automount = true
}
