cd "$(dirname "$0")"

# Update ubuntu registries

apt update

# Install dhcp

apt install isc-dhcp-server -y

# Copy the custom dhcpd.conf file to /etc/dhcp/

cp ./dhcp/dhcpd.conf /etc/dhcp/

# Copy rndc.key content in dhcpd.conf

rndc=$( cat /etc/bind/rndc.key )
sed -i "s/#rndc/$rndc/g" /etc/dhcp/dhcpd.conf

# Restart dhcp service

systemctl restart isc-dhcp-server

sleep 1s

# Show the status

systemctl status isc-dhcp-server