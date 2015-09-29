part of dliver;

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
