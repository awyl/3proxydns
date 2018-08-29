FROM alpine:edge
LABEL maintainer="@awyl https://github.com/awyl"

# install 3proxy and dnsmasq
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache add 3proxy dnsmasq && \
    # install webproc
    wget -O - https://github.com/jpillora/webproc/releases/download/0.1.9/webproc_linux_amd64.gz | gzip -d - > /usr/local/bin/webproc && \
	chmod +x /usr/local/bin/webproc && \
	# configure dnsmasq
    mkdir -p /etc/default && \
    echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq

COPY root/ /

RUN chmod +x init.sh

EXPOSE 8888/tcp 

CMD ["/init.sh"]

