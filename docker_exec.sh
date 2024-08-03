/bin/bash ./container_ipdetails.sh
host_ps=$(docker ps -q -f ancestor=ansible_host_node:compose_0)
for ps in $host_ps;do
    docker exec $ps service ssh start
    docker exec $ps apt update && docker exec $ps apt install -y curl gpg
done
control_ps=$(docker ps -q -f ancestor=ansible_control_node:compose_0)
docker exec $control_ps python3 /home/ansuser/ssh_push/sshkey_push.py