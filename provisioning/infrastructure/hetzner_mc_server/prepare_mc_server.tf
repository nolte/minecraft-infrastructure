provider "pass" {
  store_dir = "/home/nolte/.password-store"    # defaults to $PASSWORD_STORE_DIR
  refresh_store = false                # do not call `git pull`
}

provider "hcloud" {

}

data "hcloud_ssh_key" "machine_key" {
  selector = "usage=machine"
}

data "hcloud_ssh_key" "private_key" {
  selector = "usage=manual"
}

variable "volume_hotstorage" {
  default="false"
}
variable "volume_hotstorage_name" {
  default="undefined"
}
variable "location" {
  default="hel1"
}

variable "node_name" {
  default="mc-minimal"
}

data "hcloud_location" "l_computing_instance" {
  name = "${var.location}"
}

data "hcloud_volume" "v_hotstorage" {
  count = "${ var.volume_hotstorage == true ? 1 : 0}"
  name = "${var.volume_hotstorage_name}"
}
variable "server_labels" {
  type = "map"
  default = {
      stage = "dev"
      service="minecraft"
  }
}
variable "flavour" {
  default="cx11"
}
locals {
  volume_label = "hotstorage"
}

module "mc_server" {
  source = "./hetzner_computing_instance"
  name = "${var.node_name}"
  usage_root_key = "${data.hcloud_ssh_key.private_key.id}"
  ssh_machine_key_id_var="${data.hcloud_ssh_key.machine_key.0.public_key}"
  ssh_private_key_id_var="${data.hcloud_ssh_key.private_key.0.public_key}"
  flavour="${var.flavour}"
  location="${data.hcloud_location.l_computing_instance.name}"
  labels = "${var.server_labels}"
}

resource "hcloud_volume_attachment" "att_volume_mc_data" {
  count = "${ var.volume_hotstorage == true ? 1 : 0}"
  volume_id = "${data.hcloud_volume.v_hotstorage.id}"
  server_id = "${module.mc_server.instance_id}"
  automount = true
}


output "config" {
  value = "${module.mc_server.rendered}"
}
