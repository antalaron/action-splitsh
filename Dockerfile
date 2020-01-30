FROM ubuntu:18.04

MAINTAINER Antal Áron <antalaron@antalaron.hu>

COPY root /root

RUN apt-get update && \
    apt-get install -y \
        git \
        wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://github.com/splitsh/lite/releases/download/v1.0.1/lite_linux_amd64.tar.gz && \
    tar -zxpf lite_linux_amd64.tar.gz --directory /usr/local/bin/

ENTRYPOINT ["/root/entrypoint.sh"]
