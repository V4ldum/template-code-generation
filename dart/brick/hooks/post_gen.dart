import 'dart:io';

import 'package:mason/mason.dart';

const String brickNameKey = 'brick_name';

void run(HookContext context) async {
  context.logger.info('Running post_gen');

  final brickName = context.vars[brickNameKey];
  await Process.run('flutter', ['pub', 'get', '--directory=$brickName/hooks']);
}
