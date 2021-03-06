#!/bin/bash
## Server 2 script

echo  -n "Server2: Hub & Spoke Demo"
echo " "
echo " "
read -n 1 -s

echo -n "$ consul operator area creat -peer-datacenter=dc1 -retry-join=192.168.33.2"
read -n 1 -s
echo " "

## Request: Create Network Area; Parameters: dc, PeerDatacenter RetryJoin;
curl -X "POST" "http://192.168.33.3:8500/v1/operator/area" \
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
echo " "
echo -n "$ consul operator area list"
read -n 1 -s
echo " "


## Request: List Network Areas; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-areas;
curl "http://192.168.33.3:8500/v1/operator/area?dc"
echo " "
echo " "
read -n 1 -s
echo " "
echo -n "consul operator area members"
read -n 1 -s
echo " "
## Request: List Network Area Members; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-area-members;
consul operator area members
