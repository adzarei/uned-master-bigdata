#/bin/bash

header="stop_containers.sh"
version="1.0"

echo $header
echo "version: "$version
echo ""
echo ""
echo "Stoping containers...."

docker stop datanode1 datanode2 datanode3 datanode4 namenode yarnmaster
exit $?
