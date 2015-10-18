part of dliver;

var pathToWatchConfig = '${directory}/config/watch.yaml';
var watchConfig = new File(pathToWatchConfig);

checkWatchConfig() {
  check(bool found) {
    if (found) {
      watchConfig.readAsString().then((config) {
        var formats = loadYaml(config);
        fileFormats = formats['liveReload'];
      });
    } else {
      fileFormats = ['.css', '.html'];
    }
  }

  watchConfig.exists().then(check);
}
