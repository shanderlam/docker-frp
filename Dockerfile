FROM alpine

RUN cd /root && \
    wget https://github.com/fatedier/frp/releases/download/v0.27.0/frp_0.27.0_linux_amd64.tar.gz && \
    tar -xf frp_0.27.0_linux_amd64.tar.gz && \
    mv frp_0.27.0_linux_amd64 /usr/local/frp && \
    rm /root/frp_0.27.0_linux_amd64.tar.gz
EXPOSE 7000
CMD ["/usr/local/frp/frps", "-c", "/usr/local/frp/frps.ini"]
