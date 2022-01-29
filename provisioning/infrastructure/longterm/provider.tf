
provider "pass" {
}

terraform {
  backend "s3" {
    key                         = "minecraft/productuion/project"
    region                      = "main"
    bucket                      = "terraform-states"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
}
