provider "hcloud" {

}

variable "location" {
  default="hel1"
}

variable "volume_name" {
  default="volume_mc_data"
}

variable "volume_size" {
  default="10"
}

variable "volume_labels" {
  type = "map"
  default = {
    service="minecraft-server"
    type= "hotstorage"
  }
}

data "hcloud_location" "l_computing_instance" {
  name = "${var.location}"
}

resource "hcloud_volume" "v_mcdata" {
  name = "${var.volume_name}"
  size = "${var.volume_size}"
  format = "ext4"
  location = "${data.hcloud_location.l_computing_instance.name}"
  labels = "${var.volume_labels}"
 }

output "config" {
   value = "${hcloud_volume.v_mcdata.id}"
}
