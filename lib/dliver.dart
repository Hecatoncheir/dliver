library dliver;

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:watcher/watcher.dart';
import 'package:yaml/yaml.dart';

part 'server.dart';
part 'handle_script.dart';
part 'handle_socket.dart';
part 'file_formats.dart';

final HOST = InternetAddress.LOOPBACK_IP_V4;
final PORT = 35729;

var urlFrom;
var directory = Directory.current.path;
var watcher = new Watcher(directory);

var fileFormats;

class DLiver {
  DLiver() {
    makeLiveReloadServer();
    checkWatchConfig();
  }

  reloadFile(Socket socket) => sendReload(socket);
}

sendReload(Socket socket) {
  var reloadCommand =
      JSON.encode({'command': 'reload', 'path': '$urlFrom', 'liveCSS': 'true'});
  socket.add(reloadCommand);
  print('Client reloaded');
}
