#!/bin/bash +x

aws cloudformation create-stack --stack-name ${CLUSTER_NAME}-elb-dns --template-body file://templates/2_elb_dns.yaml \
    --parameters file://parameters/2_elb_dns_params.json \
    --capabilities CAPABILITY_NAMED_IAM

aws cloudformation wait stack-create-complete --stack-name ${CLUSTER_NAME}-elb-dns

aws cloudformation describe-stacks --stack-name ${CLUSTER_NAME}-elb-dns | jq .Stacks[].Outputs