/**
 * Stops npm depreciation warnings from being shown as these are usually not helpful to the end user
 * https://pnpm.io/pnpmfile
 */
function readPackage(pkg, context) {
  delete pkg.deprecated;
  return pkg;
}

module.exports = {
  hooks: {
    readPackage: readPackage
  }
}