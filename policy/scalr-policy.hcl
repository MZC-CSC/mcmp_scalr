version "v1"

provider "aws" {
  region = var.aws_region
}

policy "aws_mandatory_tag_check" {
  enforcement_level = "required"
  source            = "./main.rego"
}
