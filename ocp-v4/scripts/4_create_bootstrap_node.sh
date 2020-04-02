#!/bin/bash -x

aws s3 mb s3://${CLUSTER_NAME}-cn-northwest-1

aws s3 cp ${CLUSTER_NAME}/bootstrap.ign s3://${CLUSTER_NAME}-cn-northwest-1/${InfrastructureName}/bootstrap.ign

aws cloudformation create-stack --stack-name ${CLUSTER_NAME}-bootstrap-node --template-body file://templates/4_bootstrap_node.yaml --parameters file://parameters/4_bootstrap_node.json --capabilities CAPABILITY_NAMED_IAM

aws cloudformation wait stack-create-complete --stack-name ${CLUSTER_NAME}-bootstrap-node

aws cloudformation describe-stacks --stack-name ${CLUSTER_NAME}-bootstrap-node| jq .Stacks[].Outputs