import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  context.logger.info('Running pre_gen');
  await Process.run('rm', ['.DS_Store']);
}
