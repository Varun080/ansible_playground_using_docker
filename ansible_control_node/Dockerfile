FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    openssh-client sudo vim ansible sshpass iputils-ping

RUN useradd ansuser -m -G sudo -s /bin/bash

COPY ./pass.sh /home/ansuser
COPY ./host_ip_address.csv /home/ansuser
COPY ./sshkey_push.py /home/ansuser/

RUN chmod +x /home/ansuser/pass.sh

RUN mkdir /etc/ansible
RUN mkdir /etc/ansible/demo && mkdir /etc/ansible/roles 
RUN touch /etc/ansible/ansible.conf && touch /etc/ansible/hosts

RUN /bin/bash /home/ansuser/pass.sh

USER ansuser

RUN ssh-keygen -t ED25519 -f /home/ansuser/.ssh/id_ed25519 -q -N ""



EXPOSE 22