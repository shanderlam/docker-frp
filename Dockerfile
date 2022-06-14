FROM alpine
ARG VERSION=0.43.0

RUN apk update && apk add wget
RUN cd /root && \
    wget https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_amd64.tar.gz && \
    tar -xf frp_${VERSION}_linux_amd64.tar.gz && \
    mv frp_${VERSION}_linux_amd64 /usr/local/frp && \
    rm /root/frp_${VERSION}_linux_amd64.tar.gz
COPY ./frps.ini /usr/local/frp/frps.ini
EXPOSE 7000 7500
CMD ["/usr/local/frp/frps", "-c", "/usr/local/frp/frps.ini"]
