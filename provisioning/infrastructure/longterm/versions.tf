
terraform {
  required_version = ">= 1"
  required_providers {
    pass = {
      source  = "camptocamp/pass"
      version = "2.0.0"
    }

    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.44.1"
    }
  }
}
