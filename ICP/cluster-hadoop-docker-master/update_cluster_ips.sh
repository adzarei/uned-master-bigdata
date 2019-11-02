#/bin/bash

#Script to update the DNS host file of OSX with the correct ip addresses of each node. WIP
#TODO: add 'sudo killall -HUP mDNSResponder' at the end to flush the cache.
#TODO: use sed to update the ip address in /private/etc/hosts of each node automatically.


version="1.1"
header="UPDATE_CLUSTER_IPS.sh"

echo $header
echo "version:"$version
echo ""
echo ""
echo "Printing IP Address of each node..."

echo "namenode"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'  namenode

echo "yarnnode"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' yarnmaster

echo "datanode1"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' yarnmaster

echo "datanode2"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' yarnmaster

echo "datanode3"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' yarnmaster

echo "datanode4"
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' yarnmaster

echo "End script"
