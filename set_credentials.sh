#!/bin/bash

# Getting the line numbers of the Administrator profile
start_line=$(grep -n '\[Administrator\]' ~/.aws/credentials | cut -d : -f 1)
end_line=$(($(grep -n '\[' ~/.aws/credentials | grep -A1 "$start_line" | tail -n1 | cut -d : -f 1) - 1))

# If the Administrator profile is the last one in the file
if [[ -z "$end_line" ]] || [[ "$end_line" -le "$start_line" ]]; then
    end_line=$(wc -l < ~/.aws/credentials)
fi

# Extracting the credentials
export AWS_ACCESS_KEY_ID=$(sed -n "${start_line},${end_line}p" ~/.aws/credentials | grep 'aws_access_key_id' | awk '{print $3}')
export AWS_SECRET_ACCESS_KEY=$(sed -n "${start_line},${end_line}p" ~/.aws/credentials | grep 'aws_secret_access_key' | awk '{print $3}')

#echo $AWS_ACCESS_KEY_ID
#echo $AWS_SECRET_ACCESS_KEY

# source set_credentials.sh

# NOTE: THIS IS ACTUALLY NOT NEEDED HERE SINCE CREDENTIALS ARE STORED LOCALLY AND ARE BEING RETRIEVED AUTOMATICALLY FROM THERE