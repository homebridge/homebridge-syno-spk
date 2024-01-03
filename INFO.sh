#!/bin/bash

package="homebridge"

. "/pkgscripts-ng/include/pkg_util.sh"

version=${SPK_PACKAGE_VERSION:-1.0.0}
os_min_ver="7.0-40761"
maintainer="homebridge"
thirdparty="yes"
arch="${SPK_ARCH:-x86_64}"
reloadui="yes"
dsmuidir="ui"
dsmappname="homebridge.homebridge"
silent_install="no"
silent_upgrade="no"
adminprotocol="http"
adminurl=""
adminport="8581"
install_dep_packages="Node.js_v20"

displayname="Homebridge"
description="Homebridge on Synology DSM."
maintainer_url="https://github.com/homebridge/homebridge-syno-spk"
support_url="https://github.com/homebridge/homebridge-syno-spk"

[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
