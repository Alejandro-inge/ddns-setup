#!/bin/bash
cd "$(dirname "$0")"

# Check dhcpd configuration file
dhcpd -t -cf ./dhcp/dhcpd.conf

#check zone configuration files
named-checkzone local.lan ./dns/zones/net.local.lan
named-checkzone 4.0.10.in-addr.arpa ./dns/zones/net.local.lan.inverse

# Check bind configuration files
named-checkconf ./dns/named.conf
named-checkconf ./dns/named.conf.local
named-checkconf ./dns/named.conf.options
