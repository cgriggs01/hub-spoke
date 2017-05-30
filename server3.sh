#!/bin/bash
## Server 3 script

echo  "Server3: Hub & Spoke Demo"
echo " "
echo " "
read -n 1 -s

## Request: Create Network Area; Parameters: dc, PeerDatacenter RetryJoin;
curl -X "POST" "http://192.168.33.4:8500/v1/operator/area" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d $'{
  "PeerDatacenter": "dc1",
  "RetryJoin": [
    "192.168.33.2"
  ],
  "dc": ""
}'
echo " "
echo " "
read -n 1 -s


## Request: List Network Areas; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-areas;
curl "http://192.168.33.4:8500/v1/operator/area?dc"
echo " "
echo " "
read -n 1 -s

## Request: List Network Area Members; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-area-members;
## curl "http://192.168.33.4:8500/v1/operator/area/91ad946d-059b-9ac7-de20-fc5889a3933b/members?dc"
consul operator area members
