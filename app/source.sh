#!/bin/sh

NODE_BIN_PATH="$(readlink -f /var/packages/homebridge/target)/app/bin"

export HB_SERVICE_STORAGE_PATH="$(readlink -f /var/packages/homebridge/shares/homebridge)"
export HB_SERVICE_NODE_EXEC_PATH="$(readlink -f /var/packages/homebridge/target)/app/bin/node"
export HB_SERVICE_EXEC_PATH="$HB_SERVICE_STORAGE_PATH/node_modules/homebridge-config-ui-x/dist/bin/hb-service.js"

# synocommunity ffmpeg path
if [ -d /var/packages/ffmpeg/target/bin ]; then
  export PATH="/var/packages/ffmpeg/target/bin:$PATH"
fi

# entware path
if [ -d /opt/bin ]; then
  export PATH="/opt/bin:$PATH"
fi

# add node and node_modules bin paths
export PATH="$NODE_BIN_PATH:$HB_SERVICE_STORAGE_PATH/node_modules/.bin:$PATH"

# synology python
if [ -e /usr/bin/python3 ]; then
  export PYTHON=/usr/bin/python3
fi

# prefer to use entware python if available
if [ -e /opt/bin/python3 ]; then
  export PYTHON=/opt/bin/python3
fi 

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
