#!/bin/bash

# Creates the .env file from the parameter stored in AWS Systems Manager.
PARAM="laravel-demo-env-param"
REGION="ap-southeast-2"

aws ssm get-parameter \
  --with-decryption \
  --name $PARAM \
  --region $REGION \
  --query Parameter.Value \
  --output text > /var/www/laravel-demo/.env
