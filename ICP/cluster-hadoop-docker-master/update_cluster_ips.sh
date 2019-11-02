#/bin/bash

#Script to update the DNS host file of OSX with the correct ip addresses of each node. WIP
#TODO: add 'sudo killall -HUP mDNSResponder' at the end to flush the cache.
#TODO: use sed to update the ip address in /private/etc/hosts of each node automatically.


version="1.0"
header="UPDATE_CLUSTER_IPS.sh"

echo $header
echo "version:"$version
echo ""
echo ""
echo "Printing IP Address of each node..."

echo "namenode"
docker inspect namenode | grep IPAddress

echo "yarnnode"
docker inspect yarnmaster | grep IPAddress

echo "datanode1"
docker inspect datanode1 | grep IPAddress

echo "datanode2"
docker inspect datanode2 | grep IPAddress

echo "datanode3"
docker inspect datanode3 | grep IPAddress

echo "datanode4"
docker inspect datanode4 | grep IPAddress

echo "End script"
