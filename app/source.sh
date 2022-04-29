#!/bin/sh

nodeBin="$(readlink -f /var/packages/homebridge/target)/app/bin"

export HB_SERVICE_STORAGE_PATH="$(readlink -f /var/packages/homebridge/shares/homebridge)"
export HB_SERVICE_NODE_EXEC_PATH="$(readlink -f /var/packages/homebridge/target)/app/bin/node"
export HB_SERVICE_EXEC_PATH="$HB_SERVICE_STORAGE_PATH/node_modules/homebridge-config-ui-x/dist/bin/hb-service.js"

export PATH="$nodeBin:$HB_SERVICE_STORAGE_PATH/node_modules/.bin:/opt/bin:/var/packages/ffmpeg/target/bin:$PATH"
export PYTHON=/usr/bin/python3.8

export npm_config_global_style=true
export npm_config_audit=false
export npm_config_fund=false
export npm_config_update_notifier=false
export npm_config_store_dir=$HB_SERVICE_STORAGE_PATH/node_modules/.pnpm-store
export npm_config_prefix="$(readlink -f /var/packages/homebridge/target)/app"
export npm_config_global_pnpmfile="$(readlink -f /var/packages/homebridge/target)/app/global_pnpmfile.cjs"

export HOMEBRIDGE_SYNOLOGY_PACKAGE=1
export UIX_CUSTOM_PLUGIN_PATH=$HB_SERVICE_STORAGE_PATH/node_modules
export UIX_BASE_PATH_OVERRIDE=$HB_SERVICE_STORAGE_PATH/node_modules/homebridge-config-ui-x
export UIX_USE_PNPM=1
