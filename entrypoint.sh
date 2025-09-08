#!/bin/sh
set +e
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
tail -f /dev/null
sleep 600