#!/bin/bash +x

aws cloudformation create-stack --stack-name ${CLUSTER_NAME}-worker-node01 --template-body file://templates/6_worker_nodes.yaml --parameters file://parameters/6_worker_node01.json

aws cloudformation create-stack --stack-name ${CLUSTER_NAME}-worker-node02 --template-body file://templates/6_worker_nodes.yaml --parameters file://parameters/6_worker_node02.json

aws cloudformation create-stack --stack-name ${CLUSTER_NAME}-worker-node03 --template-body file://templates/6_worker_nodes.yaml --parameters file://parameters/6_worker_node03.json