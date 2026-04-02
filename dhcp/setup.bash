cd "$(dirname "$0")"

# Update ubuntu registries

apt update

# Install dhcp

apt install isc-dhcp-server -y

# Copy the custom dhcpd.conf file to /etc/dhcp/

cp ./dhcpd.conf /etc/dhcp/

# Copy rndc.key content in dhcpd.conf

echo $( cat /etc/bind/rndc.key ) >> /etc/dhcp/dhcpd.conf

# Restart dhcp service

systemctl restart isc-dhcp-server

sleep 1s

# Show the status

systemctl status isc-dhcp-server