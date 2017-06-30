variable name_prefix { 
    default = "svc"
}

module "create_user" {
  source = "../user"
  user = "${var.name_prefix}_create"
  policy_arns = ["${aws_iam_policy.svc_automation_create_policy.arn}"]
}
output "create_aws_access_id" {
  value = "${module.create_user.aws_access_id}"
}
output "create_aws_secret_key" {
  value = "${module.create_user.aws_secret_key}"
}

module "delete_user" {
  source = "../user"
  user = "${var.name_prefix}_delete"
  policy_arns = ["${aws_iam_policy.svc_automation_delete_policy.arn}"]
}

output "delete_aws_access_id" {
  value = "${module.delete_user.aws_access_id}"
}
output "delete_aws_secret_key" {
  value = "${module.delete_user.aws_secret_key}"
}


module "update_user" {
  source = "../user"
  user = "${var.name_prefix}_update"
  policy_arns = ["${aws_iam_policy.svc_automation_update_policy.arn}"]
}
output "update_aws_access_id" {
  value = "${module.update_user.aws_access_id}"
}
output "update_aws_secret_key" {
  value = "${module.update_user.aws_secret_key}"
}


module "read_user" {
  source = "../user"
  user = "${var.name_prefix}_read"
  policy_arns = ["${aws_iam_policy.svc_automation_read_policy.arn}"]
}
output "read_aws_access_id" {
  value = "${module.read_user.aws_access_id}"
}
output "read_aws_secret_key" {
  value = "${module.read_user.aws_secret_key}"
}


module "power_user" {
  source = "../user"
  user = "${var.name_prefix}_power"
  num_policies = 4
  policy_arns = ["${aws_iam_policy.svc_automation_read_policy.arn}",
        "${aws_iam_policy.svc_automation_create_policy.arn}",
        "${aws_iam_policy.svc_automation_update_policy.arn}",
        "${aws_iam_policy.svc_automation_delete_policy.arn}"
  ]
}
output "power_aws_access_id" {
  value = "${module.read_user.aws_access_id}"
}
output "power_aws_secret_key" {
  value = "${module.power_user.aws_secret_key}"
}
