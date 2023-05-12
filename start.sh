#!/bin/bash

docker run -d --name openvpn --restart=unless-stopped \
    --cap-add=NET_ADMIN \
    --device=/dev/net/tun \
    -v $(pwd)/root:/root \
    -v $(pwd)/openvpn:/etc/openvpn \
    -v $(pwd)/iptables:/etc/iptables \
    -p 1194:1194/udp \
    openvpn \
    ./openvpn-run.sh
