variable "usage_root_key" {}
variable "name" {}

variable "location" {
  default="hel1"
}
variable "flavour" {
  default="cx11"
}
variable "image" {
  default="centos-7"
}

variable "labels" {
  type = "map"
}

variable "ssh_machine_key_id_var" {

}

variable "ssh_private_key_id_var" {

}

# base masterdata from hcloud provider
data "hcloud_image" "default_base_image" {
  name = "${var.image}"
}

# generate cloud init script
data "template_file" "script" {
  template = "${file("${path.module}/cloudinit.yml")}"
  vars {
    ssh_machine_key_id = "${var.ssh_machine_key_id_var}"
    ssh_private_key_id = "${var.ssh_private_key_id_var}"
  }
}

output "rendered" {
  value = "${data.template_file.script.rendered}"
}

# Create a server
resource "hcloud_server" "computing_instance" {
  name = "${var.name}"
  image  = "${data.hcloud_image.default_base_image.name}"
  user_data = "${data.template_file.script.rendered}"
  server_type = "${var.flavour}"
  ssh_keys  = ["${var.usage_root_key}"]
  location = "${var.location}"
  labels = "${var.labels}"
}

output "instance_id" {
  value = "${hcloud_server.computing_instance.id}"
}
