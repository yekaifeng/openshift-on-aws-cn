#!/bin/bash +x

aws cloudformation create-stack --stack-name ${CLUSTER_NAME}-sg  --template-body file://templates/3_sg.yaml  --parameters file://parameters/3_sg_params.json  --capabilities CAPABILITY_NAMED_IAM

aws cloudformation wait stack-create-complete --stack-name ${CLUSTER_NAME}-sg

aws cloudformation describe-stacks --stack-name ${CLUSTER_NAME}-sg | jq .Stacks[].Outputs