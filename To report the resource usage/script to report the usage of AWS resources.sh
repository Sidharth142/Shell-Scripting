#!/bin/bash

########################

# Version: v1
#
#
# This script will report the AWS resource usage

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

set -x            # To put the script into a debug mode

#list s3 buckets
echo "Print list of s3 buckets"
aws s3 ls

#list ec2 instances
echo "Print list of ec2 instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[] | .InstanceId'  #`jq` is a command-line JSON processor used to parse, filter, and transform JSON data.
#aws ec2 describe-instances

#list lambda fucntions
echo "Print list of lambda functions"
aws lambda list-functions

#list IAM users
echo "Print list of IAM users"
aws iam list-users

# Execution premission
chmod +x aws_resource_tracker.sh

# This command is especially helpful if the terminal behaves unexpectedly, such as showing unreadable text or not responding to keyboard inputs properly.
 stty sane 

# Execution command
./aws_resource_tracker.sh | more    # using 'more'to read it in a better way

 