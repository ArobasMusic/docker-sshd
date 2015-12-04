# docker-sshd
A Docker image to run OpenSSH server.

## Features
- Ubuntu 12.04

## Setup

```shell
> docker pull arobasmusic/sshd
> docker run -d --name some_name -e PASSWORD="some_password" -P arobasmusic/sshd
```

If you do not set `PASSWORD` environment variable the default password is
`supercalifragilisticexpialidocious`.
