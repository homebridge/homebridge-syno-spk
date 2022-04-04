#!/bin/sh

HB_SERVICE_ENV_SOURCE_PATH="$(readlink -f /var/packages/homebridge/target/app)/source.sh"
HB_SERVICE_NODE_EXEC_PATH="$(readlink -f /var/packages/homebridge/target)/app/bin/node"
HB_SERVICE_EXEC_PATH="$(readlink -f /var/packages/homebridge/var)/lib/node_modules/homebridge-config-ui-x/dist/bin/hb-service.js"
HB_SERVICE_STORAGE_PATH="$(readlink -f /var/packages/homebridge/shares/homebridge)"

source "$HB_SERVICE_ENV_SOURCE_PATH"

echo "$(env)" > /tmp/env-dump

exec $HB_SERVICE_NODE_EXEC_PATH $HB_SERVICE_EXEC_PATH run -I -U $HB_SERVICE_STORAGE_PATH
