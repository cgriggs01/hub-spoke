#!/bin/bash
## Server 2 script

echo  -n "Server2: Hub & Spoke Demo"
echo " "
echo " "
read -n 1 -s

## Request: Create Network Area; Parameters: dc, PeerDatacenter RetryJoin;
curl -X "POST" "http://192.168.33.3:8500/v1/operator/area" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d $'{
  "PeerDatacenter": "dc1",
  "RetryJoin": [
    "192.168.33.3"
  ],
  "dc": ""
}'
echo " "
echo " "
read -n 1 -s

## Request: List Network Areas; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-areas;
curl "http://192.168.33.3:8500/v1/operator/area?dc"
echo " "
echo " "
read -n 1 -s
## Request: List Network Area Members; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-area-members;
consul operator area members
