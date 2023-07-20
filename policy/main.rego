package main

import input.tfplan as tfplan
import input.tfrun as tfrun

mandatory_tag = "mandatory-tag"

# Policy that checks if all created EC2 instances have a mandatory-tag
mandatory_tag_check = true {
    instances := resourcesByType(tfplan.resource_changes, "aws_instance")
    created_instances := filterAttributes(instances, "actions", ["CREATE"])
    tagged_instances := [res | res := created_instances[_]; contains(res.change.after.tags, mandatory_tag)]
    count(tagged_instances) == count(created_instances)
}

# Helper rules for checking resource type and created instances
resourcesByType(resources, type) = filtered {
    filtered := [resource | resource := resources[_]; resource.add.type == type]
}

filterAttributes(resources, attr, expected_values) = filtered {
    filtered := [res | res := resources[_]; contains(expected_values, res[attr])]
}
