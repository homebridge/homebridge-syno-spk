#!/bin/sh



export HB_SERVICE_STORAGE_PATH="$(readlink -f /var/packages/homebridge/shares/homebridge)"

# Use Synology supplied NodeJS v18 if installed - https://github.com/homebridge/homebridge-syno-spk/issues/124
if [ -f /var/packages/Node.js_v18/target/usr/local/bin/node ]; then
  NODE_BIN_PATH="/var/packages/Node.js_v18/target/usr/local/bin"
  export HB_SERVICE_NODE_EXEC_PATH="/var/packages/Node.js_v18/target/usr/local/bin/node"
else
  NODE_BIN_PATH="/var/packages/homebridge/target/app/bin"
  export HB_SERVICE_NODE_EXEC_PATH="/var/packages/homebridge/target/app/bin/node"
fi

export HB_SERVICE_EXEC_PATH="/var/packages/homebridge/target/app/lib/node_modules/homebridge-config-ui-x/dist/bin/hb-service.js"

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

# libatomic.so is only required on the armv7l platform - nodejs/node#37219
# we are also using the conf/resource/usr-local-linker, but this will not happen before the postinst script
if [ "$(uname -m)" = "armv7l" ]; then
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/var/packages/homebridge/target/app/lib"
fi

export npm_config_global_style=true
export npm_config_package_lock=false
export npm_config_audit=false
export npm_config_fund=false
export npm_config_update_notifier=false
export npm_config_auto_install_peers=true
export npm_config_loglevel=error
export npm_config_prefix="/var/packages/homebridge/target/app"

export HOMEBRIDGE_SYNOLOGY_PACKAGE=1
export UIX_CUSTOM_PLUGIN_PATH="$HB_SERVICE_STORAGE_PATH/node_modules"
export UIX_BASE_PATH_OVERRIDE="/var/packages/homebridge/target/app/lib/node_modules/homebridge-config-ui-x"
export UIX_USE_PNPM=0
export UIX_USE_PLUGIN_BUNDLES=1
