FROM alpine:3.6
MAINTAINER Lyndon <snakeliwei@gmail.com>
RUN mkdir -p /temp && \
    mkdir -p /frp && \
    apk --no-cache add curl && \
    curl -fSL https://github.com/fatedier/frp/releases/download/v0.14.0/frp_0.14.0_linux_amd64.tar.gz -o /temp/frp_linux_amd64.tar.gz && \
    tar xvzf /temp/frp_linux_amd64.tar.gz -C /temp  && \
    cp /temp/frp_linux_amd64/frps /frp  && \ 
    chmod +x /frp/frps  && \ 
    apk del curl && \
    rm -rf /temp  

WORKDIR /frp

EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["./frps"]
