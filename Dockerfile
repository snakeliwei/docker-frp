FROM debian:8
MAINTAINER Lyndon <snakeliwei@gmail.com>
ENV FRP_VERSION 0.9.3

RUN mkdir -p /temp

ADD https://github.com/fatedier/frp/releases/download/v$FRP_VERSION/frp_$FRP_VERSION_linux_amd64.tar.gz /temp/

RUN tar xvzf /temp/frp_0.9.3_linux_amd64.tar.gz -C / \
    && mv /frp_0.9.3_linux_amd64 /frp \ 
    && chmod +x /frp/frps \
    && chmod +x /frp/frpc \
    && rm -rf /temp 

WORKDIR /frp

EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["./frps"]
