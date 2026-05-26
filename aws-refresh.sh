#!/bin/bash

aws sso login

profiles=()
while IFS= read -r line; do
  profiles+=("$line")
done <<<"$(aws configure list-profiles)"

echo ""
echo "Exporting profile credentials to ~/.aws/credentials."

profile_blocks=""
for profile in "${profiles[@]}"; do
  echo "Profile: $profile"
  credentials="$(aws configure export-credentials --profile $profile --format process --output json)"
  profile_blocks+="[$profile]\n"
  profile_blocks+="aws_access_key_id=$(echo $credentials | jq .AccessKeyId | tr -d '"')\n"
  profile_blocks+="aws_secret_access_key=$(echo $credentials | jq .SecretAccessKey | tr -d '"')\n"
  profile_blocks+="aws_session_token=$(echo $credentials | jq .SessionToken | tr -d '"')\n\n"
done

printf $profile_blocks >~/.aws/credentials

echo "Done!"
