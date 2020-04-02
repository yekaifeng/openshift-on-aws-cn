#!/bin/bash +x

# find public hosted zone and private hosted zone
export PublicHostedZoneId=`aws route53 --endpoint-url https://route53.amazonaws.com.cn list-hosted-zones-by-name --dns-name ${BASE_DOMAIN} | jq -r .HostedZones[0].Id`
export PrivateHostedZoneId=`aws route53 --endpoint-url https://route53.amazonaws.com.cn list-hosted-zones-by-name --dns-name ${CLUSTER_NAME}.${BASE_DOMAIN} | jq -r .HostedZones[0].Id`

# create *.apps.example.com record set in public hosted zone
aws route53 change-resource-record-sets --hosted-zone-id ${PublicHostedZoneId} --change-batch file://parameters/7_ingress_dns_records.json  --endpoint-url=https://route53.amazonaws.com.cn

# create *.apps.example.com record set in private hosted zone
aws route53 change-resource-record-sets --hosted-zone-id ${PrivateHostedZoneId} --change-batch file://parameters/7_ingress_dns_records.json --endpoint-url=https://route53.amazonaws.com.cn
