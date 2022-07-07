#!/bin/sh

. "/var/packages/homebridge/target/app/source.sh"

cd "$HB_SERVICE_STORAGE_PATH"

# copy .bashrc to service user home
cp "/var/packages/homebridge/target/app/bashrc" "/var/packages/homebridge/home/.bashrc"

# copy .npmrc
cp "/var/packages/homebridge/target/app/npmrc" "$HB_SERVICE_STORAGE_PATH/.npmrc"

# remove the package-lock.json
if [ -e "$HB_SERVICE_STORAGE_PATH/package-lock.json" ]; then
  rm -rf "$HB_SERVICE_STORAGE_PATH/package-lock.json"
fi

# if coming from an old pnpm based install, delete plugins so they are freshly installed
if [ -e "$HB_SERVICE_STORAGE_PATH/pnpm-lock.yaml" ]; then
  rm -rf "$HB_SERVICE_STORAGE_PATH/node_modules"
  rm -rf "$HB_SERVICE_STORAGE_PATH/pnpm-lock.yaml"
fi

# remove homebridge-config-ui-x from the package.json
if [ -e "$HB_SERVICE_STORAGE_PATH/package.json" ]; then
  if [ "$(cat $HB_SERVICE_STORAGE_PATH/package.json | jq -r '.dependencies."homebridge-config-ui-x"')" != "null" ]; then
    packageJson="$(cat $HB_SERVICE_STORAGE_PATH/package.json | jq -rM 'del(."dependencies"."homebridge-config-ui-x")')"
    if [ "$?" = "0" ]; then
      printf "$packageJson" > "$HB_SERVICE_STORAGE_PATH/package.json"
      echo "Removed homebridge-config-ui-x from package.json"
    fi
  fi
fi

# setup initial package.json with homebridge
if [ ! -e "$HB_SERVICE_STORAGE_PATH/package.json" ]; then
  HOMEBRIDGE_VERSION="$(curl -sf https://registry.npmjs.org/homebridge/latest | jq -r '.version')"
  echo "{ \"dependencies\": { \"homebridge\": \"$HOMEBRIDGE_VERSION\" }}" | jq . > "$HB_SERVICE_STORAGE_PATH/package.json"
fi

# install plugins
echo "Installing plugins, please wait..."
npm --prefix "$HB_SERVICE_STORAGE_PATH" install
