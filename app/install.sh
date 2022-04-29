#!/bin/sh

. "/var/packages/homebridge/target/app/source.sh"

# install homebridge / homebridge ui
cd $HB_SERVICE_STORAGE_PATH
pnpm -C $HB_SERVICE_STORAGE_PATH install --unsafe-perm homebridge@latest homebridge-config-ui-x@latest

# copy .bashrc to service user home
cp /var/packages/homebridge/target/app/bashrc /var/packages/homebridge/home/.bashrc
