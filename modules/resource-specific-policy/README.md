Inspired by https://blogs.aws.amazon.com/security/post/Tx2KPWZJJ4S26H6/Demystifying-EC2-Resource-Level-Permissions"
This creates policies that will allow users to terminate start and stop instances that have a particular tag value pair


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| region | What region is this restriction for | string | - | yes |
| tag_name | The name of the tag used to filter out instances | string | `Owner` | no |
| tag_value | What value must it be | string | - | yes |
| username | The name for a logical service user | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| account_id |  |
| aws_access_id |  |
| aws_secret_key |  |
| policy_arn | the arn to use to attach to other users if needed |

