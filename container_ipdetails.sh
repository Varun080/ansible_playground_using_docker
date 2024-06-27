running_Containers=$(docker ps --format '{{.ID}},{{.Names}}')
echo "id,Name,IPaddress">>container_details.csv
for data in $running_Containers;do
    IFS=,
    read id name<<<$data
    container_IP_address=$(docker inspect $name --format {{.NetworkSettings.Networks.bridge.IPAddress}})
    
    echo $id,$name,$container_IP_address >> container_details.csv

done
