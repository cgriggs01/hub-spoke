#!/bin/bash
##Server 1 script

echo "    #    #"
echo

echo "Server1: Hub & Spoke Demo "
echo " "
echo " "
read -n 1 -s
clear
echo -n "$ consul operator area join -peer-datacenter=dc2 -retry-join=192.168.33.3"
read -n 1 -s
echo " "

## Request: Create Network Area with server2; Parameters: dc2, PeerDatacenter (empty) RetryJoin 192.168.33.3;
curl -X "POST" "http://192.168.33.2:8500/v1/operator/area" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d $'{
  "PeerDatacenter": "dc2",
  "RetryJoin": [
    "192.168.33.3"
  ],
  "dc": ""
}'
read -n 1 -s
echo " "
echo " "
echo -n "$ consul operator area list"
read -n 1 -s
echo " "

## Request: List Network Areas; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-areas;
curl "http://192.168.33.2:8500/v1/operator/area?dc"

echo " "
echo " "
echo -n "$ consul operator area members"
read -n 1 -s
echo " "

## Request: List Network Area Members; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-area-members;
consul operator area members
echo " "
echo " "
read -n 1 -s

echo -n "$ consul operator area list"
read -n 1 -s
echo " "

## Request: List Network Areas; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-areas;
curl "http://192.168.33.2:8500/v1/operator/area?dc"
echo " "
echo " "
echo -n "$ consul operator area members"
read -n 1 -s
echo " "
## Request: List Network Area Members; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-area-members;
consul operator area members
echo " "

read -n 1 -s
clear

echo "$ consul operator area create -peer-datacenter=dc3 -retry-join=192.168.33.4"
read -n 1 -s
echo " "

## Request: Create Network Area with server2; Parameters: dc3, PeerDatacenter (empty) RetryJoin 192.168.33.4;
curl -X "POST" "http://192.168.33.2:8500/v1/operator/area" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d $'{
  "PeerDatacenter": "dc3",
  "RetryJoin": [
    "192.168.33.4 "
  ],
  "dc": ""
}'
echo " "
echo " "

echo "$ consul operator area list"
read -n 1 -s
echo " "
## Request: List Network Areas; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-areas;
curl "http://192.168.33.2:8500/v1/operator/area?dc"
echo " "
echo " "
echo "$ consul operator area members"
read -n 1 -s
echo " "
## Request: List Network Area Members; Parameters: datacenter (string ""); Docs: https://www.consul.io/api/operator/area.html#list-network-area-members;
consul operator area members
