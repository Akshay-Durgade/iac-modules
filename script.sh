#!/bin/bash

AWS_CREDENTIALS_FILE="$HOME/.aws/credentials"

# Prompt for input
read -p "Enter a profile name to save temporary credentials (e.g., mfa-session): " PROFILE_NAME
read -p "Enter your AWS Account Number (12 digits): " ACCOUNT_NUMBER
read -p "Enter your IAM User Name: " USERNAME
read -p "Enter your current MFA token code (6 digits): " MFA_TOKEN

# Construct the MFA device ARN
MFA_ARN="arn:aws:iam::${ACCOUNT_NUMBER}:mfa/${USERNAME}"

# Request temporary session credentials
SESSION_JSON=$(aws sts get-session-token \
    --serial-number "$MFA_ARN" \
    --token-code "$MFA_TOKEN" \
    --duration-seconds 3600 \
    --output json)

# Check if the command succeeded
if [ $? -ne 0 ]; then
    echo "❌ Failed to get session token. Please check your input."
    exit 1
fi

# Extract credentials
AWS_ACCESS_KEY_ID=$(echo "$SESSION_JSON" | jq -r '.Credentials.AccessKeyId')
AWS_SECRET_ACCESS_KEY=$(echo "$SESSION_JSON" | jq -r '.Credentials.SecretAccessKey')
AWS_SESSION_TOKEN=$(echo "$SESSION_JSON" | jq -r '.Credentials.SessionToken')

# Write to credentials file under the specified profile
aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" --profile "$PROFILE_NAME"
aws configure set aws_secret_access_key "$AWS_SECRET_ACCESS_KEY" --profile "$PROFILE_NAME"
aws configure set aws_session_token "$AWS_SESSION_TOKEN" --profile "$PROFILE_NAME"

echo "✅ Temporary credentials saved to profile '$PROFILE_NAME' in ~/.aws/credentials"