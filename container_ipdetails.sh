running_Containers=$(docker ps -q -f ancestor=ansible_host_node:compose_0)
echo "host_ip_address" >> ./ansible_control_node/host_ip_address.csv
for data in $running_Containers;do

    container_IP_address=$(docker inspect $data | jq '.[]'| jq '.NetworkSettings' | jq '.Networks' | jq ".ansible_playground_using_docker_bridge_playground" | jq ".IPAddress")
    
    echo $container_IP_address >> ./ansible_control_node/host_ip_address.csv

done
