This module takes in a bucket and a path and will create a user that can read that


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| bucket | The bucket to gran access to | string | - | yes |
| logical_name | will be used to name the user and  policy | string | - | yes |
| path | The prefix within the bucket that will have access | string | `*` | no |

## Outputs

| Name | Description |
|------|-------------|
| aws_access_id |  |
| aws_secret_key |  |
| policy_arn |  |

