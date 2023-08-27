import 'dart:io';

import 'package:mason/mason.dart';

const String brickNameKey = 'brick_name';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running pre_gen');

  final brickName = context.vars[brickNameKey] as String;

  await createBrickBase(brickName.snakeCase);
  await removeUselessFiles(brickName.snakeCase);
  await removeForRecreation(brickName.snakeCase);

  progress.complete();
}

Future<void> createBrickBase(String brickName) async {
  await Process.run('mason', ['new', brickName, '--hooks'], runInShell: Platform.isWindows);
}

Future<void> removeUselessFiles(String brickName) async {
  await Process.run('rm', ['.DS_Store']);
  await Process.run('rm', ['$brickName/.DS_Store']);
  await Process.run('rm', ['$brickName/CHANGELOG.md']);
  await Process.run('rm', ['$brickName/LICENSE']);
  await Process.run('rm', ['$brickName/hooks/.gitignore']);
  await Process.run('rm', ['$brickName/__brick__/*']);
}

Future<void> removeForRecreation(String brickName) async {
  await Process.run('rm', ['$brickName/hooks/pre_gen.dart']);
  await Process.run('rm', ['$brickName/hooks/post_gen.dart']);
  await Process.run('rm', ['$brickName/README.md']);
}
