part of dliver;

_sendNotFound(HttpResponse response) {
  response.write('Not found');
  response.statusCode = HttpStatus.NOT_FOUND;
  response.close();
}

sendLiveReloadScript(request) {
  var pathToScript = '${directory}/packages/dliver/livereload.js';
  var lvScript = new File(pathToScript);
  lvScript.exists().then((bool found) {
    if (found) {
      request.response.headers.set('Content-Type', 'text/javascript');
      lvScript.openRead().pipe(request.response).catchError((e) {
        print(e);
      });
    } else {
      _sendNotFound(request.response);
    }
  });
}
