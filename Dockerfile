FROM ubuntu:12.04
MAINTAINER Julien Graziano <julien.graziano@arobas-music.com>
# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server
# Configure SSH service
ENV NOTVISIBLE "in users profile"
ENV PASSWORD="supercalifragilisticexpialidocious"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo "session optional pam_loginuid.so" >> /etc/pam.d/sshd
RUN echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
RUN mkdir /var/run/sshd
# Configure container
COPY sshd /usr/local/bin/
EXPOSE 22
CMD ["sshd"]
