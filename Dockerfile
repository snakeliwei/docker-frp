FROM alpine:3.6
MAINTAINER Lyndon <snakeliwei@gmail.com>
ENV FRP_VERSION 0.13.0
RUN mkdir -p /temp && \
    mkdir -p /frp

ADD https://github.com/fatedier/frp/releases/download/v0.13.0/frp_0.13.0_linux_amd64.tar.gz /temp/

RUN tar xvzf /temp/frp_0.13.0_linux_amd64.tar.gz -C /temp \
    && cp /temp/frp_0.13.0_linux_amd64/frps /frp \ 
    && chmod +x /frp/frps \
    && rm -rf /temp 

WORKDIR /frp

EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["./frps"]
