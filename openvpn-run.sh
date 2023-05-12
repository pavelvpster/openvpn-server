#!/bin/bash

echo "Add OpenVPN rules"

/etc/iptables/add-openvpn-rules.sh


echo "Run OpenVPN server"

cd /etc/openvpn

openvpn --config ./server.conf
