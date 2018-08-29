#!/bin/sh


ping -c 1 host.docker.internal | grep PING | awk '{gsub(/[\(\):]/,"",$3);print $3 " host.docker.internal"}' >> /etc/hosts 
       
# dnsmasq, port 7880
webproc --config /etc/dnsmasq.conf --port 7880 -- dnsmasq --no-daemon &

# 3proxy, port 7881
webproc --config /etc/3proxy.cfg --port 7881 -- 3proxy /etc/3proxy.cfg

