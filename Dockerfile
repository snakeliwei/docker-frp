FROM alpine:3.6
MAINTAINER Lyndon <snakeliwei@gmail.com>
ENV FRP_VERSION 0.12.0

RUN mkdir -p /temp \
    && mkdir -p /frp

ADD https://github.com/fatedier/frp/releases/download/v0.12.0/frp_0.12.0_linux_amd64.tar.gz /temp/

RUN tar xvzf /temp/frp_0.12.0_linux_amd64.tar.gz \
    && cp /temp/frp_0.12.0_linux_amd64/frps /frp \ 
    && chmod +x /frp/frps \
    && rm -rf /temp 

WORKDIR /frp

EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["./frps"]
