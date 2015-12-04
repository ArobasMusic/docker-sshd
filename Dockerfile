FROM ubuntu:12.04
MAINTAINER Julien Graziano <julien.graziano@arobas-music.com>
# Install dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server
# Configure SSH service
ENV PASSWORD="supercalifragilisticexpialidocious"
RUN echo "session optional pam_loginuid.so" >> /etc/pam.d/sshd
RUN echo "PermitRootLogin without-password" >> /etc/ssh/sshd_config
RUN mkdir /var/run/sshd
RUN mkdir /srv/depository
RUN echo "root:${PASSWORD}" | chpasswd
RUN echo "export VISIBLE=now" >> /etc/profile
ENV NOTVISIBLE "in users profile"
# Configure container
COPY sshd /usr/local/bin/
EXPOSE 22
VOLUME /srv/depository
CMD ["sshd"]
