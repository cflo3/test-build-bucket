#!/bin/bash      
apt update && apt install -y jq
curl -qL -o aws_credentials.json http://169.254.170.2/$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI > aws_credentials.json
cat aws_credentials.json
aws configure set region $AWS_REGION
aws configure set aws_access_key_id `jq -r '.AccessKeyId' aws_credentials.json`
aws configure set aws_secret_access_key `jq -r '.SecretAccessKey' aws_credentials.json`
aws configure set aws_session_token `jq -r '.Token' aws_credentials.json`
export AWS_ACCESS_KEY_ID=`jq -r '.AccessKeyId' aws_credentials.json`
export AWS_SECRET_ACCESS_KEY=`jq -r '.SecretAccessKey' aws_credentials.json`
export AWS_SESSION_TOKEN=`jq -r '.Token' aws_credentials.json`
echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
echo $AWS_SESSION_TOKEN