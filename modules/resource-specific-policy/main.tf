/**
 * Inspired by https://blogs.aws.amazon.com/security/post/Tx2KPWZJJ4S26H6/Demystifying-EC2-Resource-Level-Permissions"
 * This creates policies that will allow users to terminate start and stop instances that have a particular tag value pair
 */
 

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
