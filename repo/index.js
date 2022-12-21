const crypto = require('crypto');
const fs = require('fs-extra');
const path = require('path');


(async () => {
  const platforms = {}
  const architectures = {
    braswell: ['x86_64', 'apollolake', 'avoton', 'braswell', 'broadwell', 'broadwellnk', 'broadwellntb',
      'broadwellntbap', 'bromolow', 'cedarview', 'coffeelake', 'denverton', 'geminilake', 'grantley',
      'kvmx64', 'purley', 'skylaked', 'v1000', 'r1000'],
    evansport: ['i686', 'evansport'],
    alpine: ['armv7', 'alpine', 'alpine4k'],
    rtd1296: ['armv8', 'rtd1296'],
    armada37xx: ['armada37xx'],
    armada38x: ['armada38x'],
    monaco: ['monaco']
  }
  const spksDir = path.resolve(__dirname, 'spks');
  const spks = (await fs.readdir(spksDir)).filter(x => x.endsWith('.spk'));

  for (const spk of spks) {
    const fileStat = await fs.stat(path.resolve(spksDir, spk));
    const fileBuffer = await fs.readFile(path.resolve(spksDir, spk));
    const hashSum = crypto.createHash('md5');
    hashSum.update(fileBuffer);
    const md5sum = hashSum.digest('hex');

    const version = spk.split('-')[2].split('.spk')[0];

    const payload = {
      package: 'homebridge',
      version: version,
      dname: 'Homebridge',
      desc: 'Homebridge on Synology DSM.',
      price: 0,
      download_count: 56691,
      recent_download_count: 1138,
      link: `https://github.com/oznu/homebridge-syno-spk/releases/download/${version}/${spk}`,
      size: fileStat.size,
      md5: md5sum,
      thumbnail: [
       'https://raw.githubusercontent.com/oznu/homebridge-syno-spk/master/PACKAGE_ICON.PNG',
       'https://raw.githubusercontent.com/oznu/homebridge-syno-spk/master/PACKAGE_ICON_256.PNG'
      ],
      snapshot: [],
      qinst: true,
      qstart: true,
      qupgrade: true,
      depsers: null,
      deppkgs: null,
      conflictpkgs: null,
      start: true,
      maintainer: 'oznu',
      maintainer_url: 'https://github.com/oznu/homebridge-syno-spk',
      distributor: '',
      distributor_url: '',
      support_url: '',
      changelog:'',
      thirdparty: true,
      category: 0,
      subcategory: 0,
      type: 0,
      silent_install: false,
      silent_uninstall: false,
      silent_upgrade: false,
      auto_upgrade_from: null
    }

    const arch = spk.split('-')[1];
    for (const platform of architectures[arch]) {
      if (!platforms[platform]){
        platforms[platform] = [];
      }
      platforms[platform].push(payload);
    }
  }

  await fs.writeJson(path.resolve(spksDir, 'synology-spk-repo.json'), platforms, { spaces: 2 });
})();


