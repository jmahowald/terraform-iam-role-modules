

module "user" {
  source = "../user"
  user = "${var.username}"
  policy_arns = ["${aws_iam_policy.instance_lifecycle_policy.arn}"]
}


output "aws_access_id" {
  value = "${module.user.aws_access_id}"
}

output "aws_secret_key" {
  value = "${module.user.aws_secret_key}"
}
