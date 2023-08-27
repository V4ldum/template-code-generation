import 'dart:io';

import 'package:mason/mason.dart';

const String brickNameKey = 'brick_name';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running post_gen');

  final brickName = context.vars[brickNameKey] as String;

  await pubGet(brickName.snakeCase);

  progress.complete();
  context.logger.alert("Don't forget gen files, __brick__ folder & readme");
}

Future<void> pubGet(String brickName) async {
  await Process.run('flutter', ['pub', 'get', '--directory=$brickName/hooks'], runInShell: Platform.isWindows);
}
