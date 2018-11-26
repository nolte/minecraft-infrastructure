provider "pass" {
  store_dir = "~/.password-store"    # defaults to $PASSWORD_STORE_DIR
  refresh_store = false                # do not call `git pull`
}

provider "hcloud" {

}

variable "private_access_pass_path" {
  default = "private/keyfiles/ssh/private_ed25519/id_ed25519.pub"
}

variable "machine_access_pass_path" {
  default = "private/keyfiles/ssh/ansible_rollout/id_ed25519.pub"
}

module "private_access_key" {
  source = "./hetzner_prepare_sshkeys"

  name = "private_access"
  pass_path = "${var.private_access_pass_path}"
  labels = {
      usage = "manual"
    }
}

module "management_access_key" {
  source = "./hetzner_prepare_sshkeys"

  name = "management_key"
  pass_path = "${var.machine_access_pass_path}"
  labels = {
      usage = "machine"
    }
}
