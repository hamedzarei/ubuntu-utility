#!/usr/bin/env bash
if [ "$#" -ne 2 ];  then
   echo "bad args!"
   echo "example: ./openconnect.sh username password"
   exit 1
fi
username=$1
password=$2
echo $password > ~/openconnect_vpn_password
alias_oc="alias connectvpn=\"sudo openconnect -u  ${username} --no-cert-check --passwd-on-stdin \$1 < ~/openconnect_vpn_password\""
echo $alias_oc | cat - ~/.bash_aliases > temp && mv temp ~/.bash_aliases
echo "your can run 'connectvpn serveraddress' to connect to your vpn"
