#!/bin/bash +x

aws cloudformation create-stack --stack-name ${CLUSTER_NAME}-control-plane --template-body file://templates/5_control_plane_nodes.yaml --parameters file://parameters/5_control_plane_nodes.json

aws cloudformation wait stack-create-complete --stack-name ${CLUSTER_NAME}-control-plane

aws cloudformation describe-stacks --stack-name ${CLUSTER_NAME}-control-plane| jq .Stacks[].Outputs