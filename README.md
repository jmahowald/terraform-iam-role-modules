

This is a collection of userful terraform module that will create IAM roles that can be subsequently used in other terraform projects.
This role is intended to allow groups limited abilities to control the lifecycle of their AWS resources.


# Usage

You can either clone this project and navigate to the module you want and run terraform plan, or you can include in your own terraform through a module

```
module "svc_users" {
    source =  "github.com/jmahowald/terraform-iam-modules//modules/service-automation-policies"
    name_prefix = "arch"
}

output "read_aws_access_id" {
  value = "${module.svc_users.read_aws_access_id}"
}
output "read_aws_secret_key" {
  value = "${module.svc_users.read_aws_secret_key}"
}

/** 
 * there are also update, delete, and power users created
 */
```

