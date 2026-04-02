cd "$(dirname "$0")"

# Update repositories

apt update

# Allow port 53 tcp/udp

sudo ufw enable
sudo ufw allow 53/tcp
sudo ufw allow 53/udp

# Install bind9

apt install bind9 -y

# Copy configuration files to /etc/bind/

cp named* /etc/bind/

# Change permissions and owners

chown bind:bind /etc/bind/named*
chmod 640 /etc/bind/named*

# Copy zones to /var/lib/bind

cp zones/net* /var/lib/bind/

# Change permissions and owners

chown bind:bind /var/lib/bind/net*
chmod 640 /var/lib/bind/*

# Restart bind9

systemctl restart bind9

sleep 1s

# watch bind9 Status

systemctl status bind9