part of dliver;

handleSocketLiveReload(WebSocket socket) {
  socket.listen((message) {
    var data = JSON.decode(message);

    var helloData = {
      'command': 'hello',
      'protocols': ['http://livereload.com/protocols/official-7'],
      'serverName': 'dliver'
    };

    print('LiveReload client connect');

    switch (data['command']) {
      case 'hello':
        socket.add(JSON.encode(helloData));
        break;
    }

    watcher.events.listen((event) {
      socket.add(
          JSON.encode({'command': 'reload', 'path': '/', 'liveCSS': 'true'}));
    });

    print(message);
  });
}

handleError(error) {
  print(error);
}

