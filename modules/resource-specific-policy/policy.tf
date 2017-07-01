



resource "aws_iam_policy" "instance_lifecycle_policy" {
    name = "${replace(var.tag_value, " ", "_")}_instance_lifecycle_policy"
    path = "/"
    description = "Policy for controlling which machines a principal can access"
    #Note that the version is of the policy language, not of this policy.  The only
    #valid versions are 2012-10-17 and 2008-10-17 at the time 
    #of this writing. See http://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_grammar.html for
    #policy grammar details
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "TheseActionsDontSupportResourceLevelPermissions",
            "Effect": "Allow",
            "Action": ["ec2:Describe*"],
            "Resource": "*"
        },
        {
            "Sid": "ThisActionsSupportResourceLevelPermissions",
            "Effect": "Allow",
            "Action": ["ec2:RunInstances"],
            "Resource": [
                "arn:aws:ec2:${var.region}:${data.aws_iam_account_alias.current.account_alias}:instance/*",
                "arn:aws:ec2:${var.region}:${data.aws_iam_account_alias.current.account_alias}:key-pair/*",
                "arn:aws:ec2:${var.region}:${data.aws_iam_account_alias.current.account_alias}:security-group/*",
                "arn:aws:ec2:${var.region}:${data.aws_iam_account_alias.current.account_alias}:volume/*",
                "arn:aws:ec2:${var.region}::image/ami-*"]
        },
        {
            "Sid": "TheseActionsSupportResourceLevelPermissions",
            "Effect": "Allow",
            "Action": [
                  "ec2:TerminateInstances",
                  "ec2:StopInstances",
                  "ec2:StartInstances"],
            "Resource": "arn:aws:ec2:${var.region}:${data.aws_iam_account_alias.current.account_alias}:instance/*",
            "Condition": {
                "StringEquals": {"ec2:ResourceTag/${var.tag_name}": "${var.tag_value}"}
            }
        }
    ]
}
EOF
}

data "aws_iam_account_alias" "current" { }

output "account_id" {
  value = "${data.aws_iam_account_alias.current.account_alias}"
}
output "policy_arn" {
    description = "the arn to use to attach to other users if needed"
    value =  "${aws_iam_policy.instance_lifecycle_policy.arn}"
}

