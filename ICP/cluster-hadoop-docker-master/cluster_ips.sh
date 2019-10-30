#/bin/bash

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
