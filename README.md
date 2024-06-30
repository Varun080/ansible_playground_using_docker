# ansible_playground_using_docker

This repo containes information and code to create docker continers and images which will help in creating an sandbox type environment for lern and practice ansible commands, configration and how the overall ansible environment workes.

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

## Create images for host and control nodes.

### Create image for Host Nodes

Start docker client with below command:

```
sudo systemctl start docker
```

Once the docker clinet started validate by running below command:

```
docker ps
```

Copy this repo in your local machine

```
git clone "https://github.com/Varun080/ansible_playground_using_docker.git"
```

Change directory to folder

```
cd ./ansible_playground_using_docker
```

Run below command to create host node image

```
docker build -t <name of the image : version> ansible_host_node/
```

### Create image for Control Node

Make sure docker client is runnig and you are in folder `./ansible_playground_using_docker`.

Run below command to create control node image

```
docker build -t <name of the image : version> ansible_control_node/
```

### Use of Container_details.csv and container_ipdetails.sh

Once all the contianers are created we need to get the ip address of all the running container (assuming that all the containers which are running, are either control or host nodes for the sandbox). We will use this ip address to connect control node to host nodes using ssh on port 22 and update the host file at `/etc/ansible/host` for ansible to use and perform task.

To get the IP details, run below command: (if you are using bash shell)

 ```
 sudo /bin/bash container_ipdetails.sh 
 ```

It will update the file [container_details.csv](container_details.csv) with id, name and IPAddress off the running containers.

Then we can take the ip address from the file and update it into file [host_ip_address.csv](./ansible_control_node/host_ip_address.csv) and run below commands inside the control node to connect all the host nodes with control node with password less ssh key on the port 22.
```
# go to home directory for user 'ansuser' 
cd /home/ansuser/
```

```
python3 sshkey_push.py
```

you can validate it by running below conde.

```
ssh ansuser@<ipaddress of the host node>
```
It will provide the access over host node without any password requirement