# ansible_playground_using_docker
This is a repo to create docker containers for learning ansible  

## create a image for control node

```
docker build -t <ansible_control_node:1> ansible_control_node/
```

check image created

```
docker image list
```

image

### create control node for ansible

```
docker run -t -d -p 22 --name <name_of_the_container> <ansible_control_node:1>
```

created container

```
docker ps
```

image

## create image for host node

```
docker build -t <ansible_host_node:1> ansible_host_node/
```

check image created

```
docker image list
```

image

### create host node for ansible

```
docker run -t -d -p 22 --name <name_of_the_container> <ansible_host_node:1>
```
created container

```
docker ps
```

image


