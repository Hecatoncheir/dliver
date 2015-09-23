library dliver;

import 'dart:io';
import 'dart:convert';
// import 'package:watcher/watcher.dart';

final HOST = InternetAddress.LOOPBACK_IP_V4;
final PORT = 35729;

handleSocketLiveReload(WebSocket socket) {
  socket.listen((message) {
    var data = JSON.decode(message);

    var helloData = {
      'command': 'hello',
      'protocols': ['http://livereload.com/protocols/official-7'],
      'serverName': 'LiveReload 2'
    };

    switch (data['command']) {
      case 'hello':
        socket.add(JSON.encode(helloData));
        break;
    }

    print('LiveReload connect');
  });
}

handleError(error) {
  print(error);
}

_sendNotFound(HttpResponse response) {
  response.write('Not found');
  response.statusCode = HttpStatus.NOT_FOUND;
  response.close();
}

sendLiveReloadScript(request) {
  var lvScript = new File('packages/dliver/livereload.js');
  lvScript.exists().then((bool found) {
    if (found) {
      lvScript.openRead().pipe(request.response).catchError((e) {});
    } else {
      _sendNotFound(request.response);
    }
  });
}

makeLiveReloadServer() {
  print('Wait LiveReload browser connection');

  HttpServer.bind(HOST, PORT).then((_server) {
    _server.listen((HttpRequest request) {
      switch (request.uri.path) {
        case '/livereload':
          WebSocketTransformer.upgrade(request).then((WebSocket socket) {
            handleSocketLiveReload(socket);
          });
          break;
        case '/livereload.js':
          sendLiveReloadScript(request);
          break;
      }
    }, onError: handleError);
  }).catchError(handleError);
}
