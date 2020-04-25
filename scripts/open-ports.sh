#!/usr/bin/env bash

aws_profiles=( california saopaulo stockholm sydney tokyo virginia )

for p in "${aws_profiles[@]}"
do
  echo "${p}"
  aws ec2 authorize-security-group-ingress \
      --profile "${p}" \
      --group-name docker-machine \
      --protocol udp \
      --port 27601 \
      --cidr 0.0.0.0/0
  aws ec2 authorize-security-group-ingress \
      --profile "${p}" \
      --group-name docker-machine \
      --protocol tcp \
      --port 27601 \
      --cidr 0.0.0.0/0
done
