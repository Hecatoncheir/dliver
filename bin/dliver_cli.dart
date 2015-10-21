library dliver.cli;

import 'package:cupid/cupid.dart';
import 'package:dliver/dliver.dart';

Program program = new Program();

main(_, __) => cupid(new DliverCli(), _, __);

class DliverCli extends Program {
  Dliver dliver;

  @Command('Start the livereload server')
  start() async {
    printInfo('Activate livereload...');
    dliver = await new Dliver();
  }
}
