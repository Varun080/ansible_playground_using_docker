FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    openssh-server sudo vim iputils-ping 
WORKDIR /home/
RUN useradd -m ansuser -G sudo -s /bin/bash
COPY ./pass.sh /home/ansuser/
# RUN echo "echo -e 'root\nroot' | passwd ansuser" > pass.sh
# RUN ls
RUN chmod +x /home/ansuser/pass.sh
RUN /bin/bash /home/ansuser/pass.sh
ENTRYPOINT service ssh start && bash

EXPOSE 22