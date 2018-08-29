# 3proxy and Dnsmasq

The purpose of this container is to enable us to develop locally with real hostname without messing the machine's host file.

This container is setup with [webproc](https://github.com/jpillora/webproc/).  Both 3proxy and dnsmasq are accessible with webproc on different.  Webproc can let you change settings without copying, rebuilding, or restarting.

## Install SwitchyOmega on Chrome

https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif

## Run

```sh
docker-compse up -d
```

## Access to webproc

### Dnsmasq

Browse to `http://localhost:7880`

### 3proxy

Browse to `http://localhost:7881`

## Persist changes

To persist changes, you will need to map the config files to local files.  Uncomment volumes lines in the `docker-compose.yml` and change the path as needed.

## Connect

Setup a proxy with SwitchyOmega.  You can switch back and forth easily between this proxy server and the system default quickly.

```text
Protocol: Http
Server: localhost
Port: 8888
```