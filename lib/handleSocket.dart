part of dliver;

handleSocketLiveReload(WebSocket socket) async {
  print('LiveReload Client connect');

  socket.listen((message) {
    var data = JSON.decode(message);
    await urlFrom = data['url'];

    var helloData = {
      'command': 'hello',
      'protocols': ['http://livereload.com/protocols/official-7'],
      'serverName': 'dliver'
    };

    switch (data['command']) {
      case 'hello':
        socket.add(JSON.encode(helloData));
        break;
    }

    watcher.events.listen((event) {
      var extension = path.extension(event.path);
      if (fileFormats.contains(extension)) {
        sendReload(socket);
      } else {
        return;
      }
    });
  });
}
