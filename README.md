<p align="center">
<img width="400px" src="https://user-images.githubusercontent.com/3979615/79035227-bdd5be00-7bff-11ea-900f-2fef01bba4ba.png">
</p>

[![GitHub release](https://img.shields.io/github/release/homebridge/homebridge-syno-spk.svg)](https://github.com/homebridge/homebridge-syno-spk/releases/latest)
[![Build](https://github.com/homebridge/homebridge-syno-spk/actions/workflows/Stage%201%20-%20Build%20and%20Create%20Prerelease.yml/badge.svg)](https://github.com/homebridge/homebridge-syno-spk/actions/workflows/Stage%201%20-%20Build%20and%20Create%20Prerelease.yml)
[![Donate](https://badgen.net/badge/donate/paypal/yellow)](https://paypal.me/oznu)

# Homebridge Package for Synology DSM

This third-party Synology Package simplifies the process of running [Homebridge](https://github.com/homebridge/homebridge) on Synology NAS devices running DSM 7.2 or newer.

## Supported Models

* **x86_64** - All 64-bit Intel / AMD CPU models ( braswell )
* **rtd1296** (armv8) - DS420j, DS220j, RS819, DS418, DS218, DS218play, DS118
* **rtd1619b** (armv8) - DS124, DS223, DS223j, DS423
* **armada37xx** (armv8) - DS120j, DS119j
* **armada38x** (armv7) - DS419slim, DS218j, RS217, RS816, DS416j, DS416slim, DS216, DS216j, DS116
* **alpine** (armv7) - DS1817, DS1517, DS416, DS1515, DS715, DS215+

### Unsupported Models

* **comcerto2k** - DS414j - no Node.js
* **evansport** (i686) - DS414play, DS415play - Synology does not offer its Node.js v22 package for these
* **alpine** (armv7) - DS2015xs - no Node.js


## Installation

This package will deploy Homebridge and the Homebridge UI natively on your Synology NAS. It will create a new shared named `homebridge` to store the Homebridge configuration and user data.

#### Dependencies

This package uses the Node.js v22 package supplied by Synology. Package Center installs it for you if you do not have it. Synology only offers it on DSM 7.2 and newer.

#### Add the Homebridge Package Source:

1. Open Package Center in DSM and select `Settings`.
2. Select the `Package Sources` tab.
3. Click `Add`.
4. In `Name`, enter `Homebridge`.
5. In `Location`, enter `https://synology.homebridge.io`.
6. Click `OK`.

#### Install Homebridge:

1. Go back to Package Center and search for `Homebridge`.
2. Click on the `Homebridge` package, then select `Install`.
3. Click `Agree` when warned about using a package from an unknown publisher.
4. Click `Done` to confirm installation.

You can also download the `.spk` file for your model from the [releases page](https://github.com/homebridge/homebridge-syno-spk/releases/latest) and install it with `Manual Install` in Package Center. The rtd1619b models use the rtd1296 file.

*Please note low power devices may take 10-15 minutes to install the package.*

Once the install has completed, a new Homebridge menu item will be shown in DSM which will open the Homebridge UI.

The Homebridge UI app starts on port `8581`.

If you have the Synology Firewall enabled, make a rule to allow access to port 8581 and the port Homebridge was assigned to.

### Recommended Optional Steps:

* [Enable compiling native modules](https://github.com/homebridge/homebridge-syno-spk/wiki/DSM-7:-Enable-Compiling-Of-Native-Modules)
* [Install ffmpeg with libfdk_aac](https://github.com/homebridge/homebridge-syno-spk/wiki/DSM-7:-ffmpeg-with-libfdk_aac)
* [Install git](https://github.com/homebridge/homebridge-syno-spk/wiki/DSM-7:-Install-git)

## Issues

If you have an issue with the installation of Homebridge using this package please raise an issue on this project's GitHub page. For everything else:

* Homebridge UI Issues: [homebridge/homebridge-config-ui-x](https://github.com/homebridge/homebridge-config-ui-x)
* General Homebridge Issues: [homebridge/homebridge](https://github.com/homebridge/homebridge)
* For problems with individual plugins please raise issues on the relevant GitHub project page.

## Contributing

Pull requests are welcome.

## Setting up for development

See the [Synology DSM Developer Guide](https://help.synology.com/developer-guide/).

## License

Copyright (C) 2017-2022 oznu

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the [GNU General Public License](./LICENSE) for more details.
