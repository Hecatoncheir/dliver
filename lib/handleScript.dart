part of dliver;

_sendNotFound(HttpResponse response) {
  response.write('Not found');
  response.statusCode = HttpStatus.NOT_FOUND;
  response.close();
}

sendLiveReloadScript(request) {
  var lvScript = new File('packages/dliver/livereload.js');
  lvScript.exists().then((bool found) {
    if (found) {
      request.response.headers.set('Content-Type', 'text/javascript');
      lvScript.openRead().pipe(request.response).catchError((e) {});
    } else {
      _sendNotFound(request.response);
    }
  });
}
