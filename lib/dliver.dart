library dliver;

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:watcher/watcher.dart';

part 'server.dart';
part 'handleScript.dart';
part 'handleSocket.dart';

final HOST = InternetAddress.LOOPBACK_IP_V4;
final PORT = 35729;

var watcher = new DirectoryWatcher(path.absolute('/'));

class DLiver {
  DLiver(){
    makeLiveReloadServer();
  }
}

