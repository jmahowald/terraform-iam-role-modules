/**
 * This module takes in a bucket and a path and will create a user that can read that
 */

variable "path" {
   description = "The prefix within the bucket that will have access"
   default =   "*"
}

variable "bucket" {
    description = "The bucket to gran access to"
}

variable "logical_name" {
    description = "will be used to name the user and  policy"
}


data "aws_iam_policy_document" "read_bucket" {
  statement {
    sid = "1"

    actions = [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:ListBucket",
        "s3:ListBucketVersions"
    ]

    // This is probably dum and stupid, but my current examples
    // have both a bucket and path entry.  TODO test to see if we can collapse
    resources = [
      "arn:aws:s3:::${var.bucket}",
      "arn:aws:s3:::${var.bucket}/${var.path}" 
    ]
  }
}

resource "aws_iam_policy" "read_bucket_policy" {
  name   = "read_${var.logical_name}_policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.read_bucket.json}"
}


module "user" {
  source = "../user"
  user   = "read_${var.logical_name}_user"
  policy_arns = ["${aws_iam_policy.read_bucket_policy.arn}"]
}

output "aws_access_id" {
	value = "${module.user.aws_access_id}"
}
output "aws_secret_key" {
	value = "${module.user.aws_secret_key}"
}

output "policy_arn" {
    value =  "${aws_iam_policy.read_bucket_policy.arn}"
}
