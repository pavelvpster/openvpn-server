#!/bin/bash

docker run -it --rm --name openvpn \
    --cap-add=NET_ADMIN \
    --device=/dev/net/tun \
    -v $(pwd)/root:/root \
    -v $(pwd)/openvpn:/etc/openvpn \
    -v $(pwd)/iptables:/etc/iptables \
    openvpn \
    ./openvpn-install.sh


# sudo chown -R pi:pi ./openvpn
