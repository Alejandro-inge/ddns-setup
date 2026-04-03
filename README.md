# ddns-setup
This is an example of a DDNS configuration for a local network.

## Configurations

- DHCP server with ddns support
- DNS server with ddns support (reverse zones)

## Architecture

- isc-dhcp-server
- bind9
- ubuntu 25.10
- perl

you can configure your own values. This repo includes

- network 10.0.4.0/24
- Server IP: 10.0.4.2
- domain name: local.lan
- ddns domain name: local.lan
- ddns reverse domain name: 4.0.10.in-addr.arpa
- host: ubuntu-dhcp

## Steps

- Within this directories/files, you can configure you own values if you want to:

    - dhcp/dhcpd.conf
    - dns/zones/*
    - dns/named.conf.local

- Then, Execute the command below to check everything is ok:

        sudo bash check-configs.bash

- Finally, execute:

        sudo bash init.bash

> If you change directory or file names, a refactorzation will be needed in the scripts and some configuration files. Consistency is key.

## Validation

If everything went good, connect a new device in the network. You should be able to see the new client registered with a dynamic dns.

Run this in the ddns server

    host <new-device-IP-address>

or (works with the client too)

    nslookup <new-device-IP-address>

or (works with the client too)

    dig <device-hostname>.local.lan
