version "v1"

policy "minimum-instance-size" {
  description = "All instances must have meet a minimum instance size."

  checkRequiredAttributes = true
  WARNING_MESSAGE = "Instance size should be at least t2.small. Automatically fixing the issue."

  rule "check-instance-size" {
    check "aws_instance.instance_type" is_attr_exists
    check "aws_instance.instance_type" satisfies "substring(., 0, 2) != 't1'"
    on_failure WARNING_MESSAGE
  }
}
