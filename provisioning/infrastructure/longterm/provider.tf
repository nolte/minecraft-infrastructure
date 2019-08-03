
provider "pass" {
  store_dir     = "~/.password-store" # defaults to $PASSWORD_STORE_DIR
  refresh_store = false               # do not call `git pull`
}

terraform {
  backend "s3" {
    key                         = "minecraft/productuion/project"
    region                      = "main"
    bucket                      = "terraform-states"
    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
}
