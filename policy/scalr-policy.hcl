version "v1"

policy "aws_mandatory_tag_check" {
  enforcement_level = "required"
  source            = "./main.rego"
}
