#!/usr/bin/env bash
t=/etc/resolv.conf
sudo sed -i "/nameserver 185.51.200.2/d" $t
sudo sed -i "/nameserver 178.22.122.100/d" $t
echo "nameserver 185.51.200.2" | cat - $t > temp && sudo mv temp $t
echo "nameserver 178.22.122.100" | cat - $t > temp && sudo mv temp $t
#sudo echo "nameserver 185.51.200.2" >> t
#sudo echo "nameserver 178.22.122.100" >> t