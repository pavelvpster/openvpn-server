# OpenVPN in Docker

## Build
```shell
docker build -t openvpn .
```


## Install OpenVPN

Use the script from https://github.com/angristan/openvpn-install

```shell
docker run -it --rm --name openvpn \
	--cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	-v $(pwd)/root:/root \
	-v $(pwd)/openvpn:/etc/openvpn \
	-v $(pwd)/iptables:/etc/iptables \
	openvpn \
	./openvpn-install.sh


sudo chown -R pi:pi ./openvpn
```

Build command is in `build.sh`

The only change I made in configuration is Google DNS than I choosen instead of default

Client configuration file .ovpn will be created in `/root` directory

Don't forget to update client configuration file with the correct port number (because mapping is configured on WiFi router not here)


## Start OpenVPN server
```shell
docker run -d --name openvpn --restart=unless-stopped \
	--cap-add=NET_ADMIN \
	--device=/dev/net/tun \
	-v $(pwd)/root:/root \
	-v $(pwd)/openvpn:/etc/openvpn \
	-v $(pwd)/iptables:/etc/iptables \
	-p 1194:1194/udp \
	openvpn \
	./openvpn-run.sh
```

Start command is in `start.sh`
