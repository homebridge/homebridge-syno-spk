#!/bin/sh

nodeBin="$(readlink -f /var/packages/homebridge/target)/app/bin"
HB_SERVICE_STORAGE_PATH="$(readlink -f /var/packages/homebridge/shares/homebridge)"

export PATH="$nodeBin:$HB_SERVICE_STORAGE_PATH/node_modules/.bin:/opt/bin:/var/packages/ffmpeg/target/bin:$PATH"
export PYTHON=/usr/bin/python3.8

export npm_config_global_style=true
export npm_config_audit=false
export npm_config_fund=false
export npm_config_store_dir=$HB_SERVICE_STORAGE_PATH/node_modules/.pnpm-store

export HOMEBRIDGE_SYNOLOGY_PACKAGE=1
export UIX_BASE_PATH_OVERRIDE=$HB_SERVICE_STORAGE_PATH/node_modules/homebridge-config-ui-x
export UIX_USE_PNPM=1

# copy .bashrc to service user home
cp /var/packages/homebridge/target/app/bashrc /var/packages/homebridge/home/.bashrc