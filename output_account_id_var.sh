#!/bin/bash

#HT: http://stackoverflow.com/questions/33791069/quick-way-to-get-aws-account-number-from-the-cli-tools
account_id=`aws ec2 describe-security-groups --group-names 'Default' --query 'SecurityGroups[0].OwnerId' --output text`
echo "account_id =\"$account_id\""
