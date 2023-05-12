FROM debian:stable-slim

RUN apt update && \
    apt install -y iproute2 curl wget ca-certificates gnupg openssl openvpn iptables && \
    rm -rf /var/lib/apt/lists/*

COPY openvpn-run.sh /home/

ADD https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh /home

RUN chmod 755 /home/openvpn-install.sh

WORKDIR /home

EXPOSE 1194/udp

CMD ["bash"]
