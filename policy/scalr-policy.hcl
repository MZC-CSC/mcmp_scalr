terraform {
  required_version = ">= 1.0.0"
  backend "remote" {
    hostname     = "my.scalr.com"
    organization = "my-org"
    workspaces {
      name = "my-project"
    }
  }
}
