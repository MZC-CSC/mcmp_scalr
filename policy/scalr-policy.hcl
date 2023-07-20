# policy.hcl

package main

default allow = false

# Example rule to allow creating instances with specific tags
allow {
    input.method = "POST"
    input.path = ["compute", "instances"]
    input.request.body.tags[key] = value
    key = "environment"
    value = "production"
}

# Example rule to allow creating a specific type of database
allow {
    input.method = "POST"
    input.path = ["database", "instances"]
    input.request.body.engine = "mysql"
}
