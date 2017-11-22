# Synology Package for Homebridge Docker.

This third-party Synology Package simplifies the process of running [oznu/docker-homebridge](https://github.com/oznu/docker-homebridge) on DSM 6.1.4 or later.

This package will deploy the [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge/) image using the recommended settings.

* `--net=host` is set automatically.
* `-e TZ` variable is set based on your current timezone of your Synology NAS.
* `-e PUID` variable is set to the same UID as the user who installs the package in DSM.
* `-e PGID` variable is set to the same GID as the user who isntalls the package in DSM.
* `-v /homebridge` is setup automatically using a share choosen by you during the installation. If the share does not exist it will create it for you.

## How to install

**Step 1:** Download the latest `.spk` from here: https://github.com/oznu/homebridge-syno-spk/releases

**Step 2:** Open Package Center in DSM and select the `Manual Install` option.

**Step 3:** Click `Yes` when warned about using a package from an unknown publisher.

**Step 4:** Enter the name of the share you want to use for your Homebridge config.

**Step 5:** Complete the wizard. The first time you install may take some time as the latest [oznu/homebridge](https://hub.docker.com/r/oznu/homebridge/) image is downloaded from Docker Hub.

## Setting up for development

See the [Synology DSM 6.0 Developer Guide](https://developer.synology.com/developer-guide/index.html).
