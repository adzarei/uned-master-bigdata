header="start_container.sh"
version="1.0"

echo $header
echo "version: "$version
echo ""
echo ""

# Starting containers in order.
docker start namenode yarnmaster datanode1 datanode2 datanode3 datanode4
exit $?
