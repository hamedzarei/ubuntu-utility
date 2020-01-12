#!/usr/bin/env bash
t=/etc/resolv.conf
sudo sed -i "/nameserver 185.51.200.2/d" $t
sudo sed -i "/nameserver 178.22.122.100/d" $t
echo "nameserver 185.51.200.2" | sudo tee -a $t
echo "nameserver 178.22.122.100" | sudo tee -a $t
