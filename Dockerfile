FROM alpine:3.7
LABEL author = "snakeliwei@gmail.com"
ENV FRP_VERSION 0.20.0
RUN mkdir -p /temp && \
    mkdir -p /frp && \
    apk --no-cache add curl && \
    curl -fSL https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz -o /temp/frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    tar xvzf /temp/frp_${FRP_VERSION}_linux_amd64.tar.gz -C /temp  && \
    cp /temp/frp_${FRP_VERSION}_linux_amd64/frps /frp  && \ 
    chmod +x /frp/frps  && \ 
    apk del curl && \
    rm -rf /temp

WORKDIR /frp

EXPOSE 80 443 6000 7000 7500

ENTRYPOINT ["./frps"]
