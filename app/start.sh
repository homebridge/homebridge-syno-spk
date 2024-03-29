#!/bin/sh

. "/var/packages/homebridge/target/app/source.sh"

cd "$HB_SERVICE_STORAGE_PATH"

# check for invalid package.json file
if [ -e "$HB_SERVICE_STORAGE_PATH/package.json" ]; then
  jq empty "$HB_SERVICE_STORAGE_PATH/package.json" 2>/dev/null
  if [ "$?" != 0 ]; then
    echo "ERROR: $HB_SERVICE_STORAGE_PATH/package.json is not a valid JSON file; deleting..."
    rm -rf "$HB_SERVICE_STORAGE_PATH/package.json"
    rm -rf "$HB_SERVICE_STORAGE_PATH/pnpm-lock.yaml"
    rm -rf "$HB_SERVICE_STORAGE_PATH/package-lock.json"
    rm -rf "$HB_SERVICE_STORAGE_PATH/node_modules"
  fi
fi

# remove the package-lock.json
if [ -e "$HB_SERVICE_STORAGE_PATH/package-lock.json" ]; then
  rm -rf "$HB_SERVICE_STORAGE_PATH/package-lock.json"
fi

# check for missing homebridge
if [ ! -f "$HB_SERVICE_STORAGE_PATH/node_modules/homebridge/package.json" ]; then
  echo "Re-installing homebridge..."
  npm --prefix "$HB_SERVICE_STORAGE_PATH" install --save homebridge@latest
fi

# remove homebridge-config-ui-x package from the plugins store
if [ -e "$HB_SERVICE_STORAGE_PATH/node_modules/homebridge-config-ui-x" ]; then
  rm -rf "$HB_SERVICE_STORAGE_PATH/node_modules/homebridge-config-ui-x"
fi

exec "$HB_SERVICE_NODE_EXEC_PATH" "$HB_SERVICE_EXEC_PATH" run -I -U "$HB_SERVICE_STORAGE_PATH" -P "$HB_SERVICE_STORAGE_PATH/node_modules" --strict-plugin-resolution
