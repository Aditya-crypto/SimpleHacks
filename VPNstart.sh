if ! which openvpn > /dev/null; then
sudo apt install openvpn
fi
wget --user aditya.g@students.iiit.ac.in --password Agastya30# https://vpn.iiit.ac.in/secure/ubuntu.ovpn
chmod 777 ubuntu.ovpn
sed 's/127.0.1.1/10.4.20.204/g' /etc/resolv.conf
sudo -b openvpn --config ubuntu.ovpn
echo connected
rm ubuntu.ovpn

