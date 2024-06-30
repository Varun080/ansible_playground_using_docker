# ansible_playground_using_docker

This repo containes information and code to create docker continers and images which will help in creating an sandbox type environment for learn and practice ansible commands, configration and how the overall ansible environment workes.

## Content

> [container_details.csv](container_details.csv) : this file have the data for Container_ID, Container_Name and Container_IP address of all the running container of your environment


> [container_ipdetails.sh](container_ipdetails.sh) :  it is a shell script to get the data which is present in the file conteiner_details.csv


> [ansible_host_node](./ansible_host_node/) : this direcotory containes the files which is used to create a image for host nodes. Host nodes are the nodes on which we will perform activity from the control node.

>> [Dockerfile](./ansible_host_node/Dockerfile) : it is the docker file to create the image for ansible host nodes.

>> [pass.sh](./ansible_host_node/pass.sh) : this shell script containes the password for the common user with in all the nodes which will be used to perform all the ansible tasks. it will update the password "root" for the user "ansuser".


>[ansible_control_node](./ansible_control_node/): this directory containes the files which will be used to create the image for ansible control node. This is the node in which ansible will be installed.

>> [Dockerfile](./ansible_control_node/Dockerfile) : it is the docker file to create the image for ansible host nodes.

>>[host_ip_address.csv](./ansible_control_node/host_ip_address.csv): this is an empty file with hedder "host_ip_address". this will be used to create ssh connection between control and all the host nodes.

>>[sshkey_push.py](./ansible_control_node/sshkey_push.py) : this python script will be used enable ssh connection between control node and host nodes.

>>[pass.sh](./ansible_control_node/pass.sh) :this shell script containes the password for the common user with in all the nodes which will be used to perform all the ansible tasks. it will update the password "root" for the user "ansuser".

#### ***Note: password and username must be same and available on both control and all the host nodes with elevated privilege.***
