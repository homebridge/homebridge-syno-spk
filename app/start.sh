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
    rm -rf "$HB_SERVICE_STORAGE_PATH/node_modules"
  fi
fi

# if the ui failed to load due to a module being missing, re-install everything
if [ -f "$HB_SERVICE_STORAGE_PATH/.uix-module-not-found" ]; then
  echo "Homebridge UI reported it could not start because a module was missing, re-installing everything..."
  echo "Re-installing Homebridge, Homebridge UI and all user plugins..."
  rm -rf "$HB_SERVICE_STORAGE_PATH/pnpm-lock.yaml"
  rm -rf "$HB_SERVICE_STORAGE_PATH/node_modules"
  pnpm -C "$HB_SERVICE_STORAGE_PATH" install
  if [ "$?" -eq 0 ]; then
    rm -rf "$HB_SERVICE_STORAGE_PATH/.uix-module-not-found"
    echo "Re-installation completed."
  else
    echo "Re-installation failed."
  fi
fi

# check for missing homebridge-config-ui-x
if [ ! -f "$HB_SERVICE_EXEC_PATH" ]; then
  echo "Re-installing homebridge-config-ui-x..."
  pnpm -C "$HB_SERVICE_STORAGE_PATH" install --save homebridge-config-ui-x@latest
fi

# check for missing homebridge
if [ ! -f "$HB_SERVICE_STORAGE_PATH/node_modules/homebridge/package.json" ]; then
  echo "Re-installing homebridge..."
  pnpm -C "$HB_SERVICE_STORAGE_PATH" install --save homebridge@latest
fi

exec "$HB_SERVICE_NODE_EXEC_PATH" "$HB_SERVICE_EXEC_PATH" run -I -U "$HB_SERVICE_STORAGE_PATH" -P "$HB_SERVICE_STORAGE_PATH/node_modules" --strict-plugin-resolution
