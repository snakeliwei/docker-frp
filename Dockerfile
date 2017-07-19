FROM alpine:3.6
MAINTAINER Lyndon <snakeliwei@gmail.com>
ENV FRP_VERSION 0.13.0
RUN addgroup -S frp && adduser -S -G frp frp && \
    apk add --no-cache 'su-exec>=0.2' && \
    mkdir -p /temp && \
    mkdir -p /frp

ADD https://github.com/fatedier/frp/releases/download/v$FRP_VERSION/frp_$FRP_VERSION_linux_amd64.tar.gz /temp/

RUN tar xvzf /temp/frp_$FRP_VERSION_linux_amd64.tar.gz -C /temp \
    && cp /temp/frp_$FRP_VERSION_linux_amd64/frps /frp \ 
    && chmod +x /frp/frps \
    && rm -rf /temp 

WORKDIR /frp

EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["su-exec frp /frps"]
