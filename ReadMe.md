LiveReload dart library - Dliver
================================

Makes server for work with liveReload [extension](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)

Import library:

```
import 'package:dliver/dliver.dart';

```

And create new Dliver:

```
main(){
  var dliver = new DLiver();
}
```

Make **config/watch.yaml** for extensions:

```
liveReload:
  - .html

```

by default watching *.html and .css* files
