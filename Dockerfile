FROM alpine:3.8
MAINTAINER Stille <stille@ioiox.com>

WORKDIR /
ENV FRP_VERSION 0.34.3

RUN set -x && \
	wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
	tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
	cd frp_${FRP_VERSION}_linux_amd64 && \
	mkdir /frp && \
	mv frpc frpc.ini /frp && \
	cd .. && \
	rm -rf *.tar.gz frp_${FRP_VERSION}_linux_amd64

VOLUME /frp

CMD /frp/frpc -c /frp/frpc.ini