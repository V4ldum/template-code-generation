import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running post_gen');

  await generateRepository();

  progress.complete();
}

Future<void> generateRepository() async {
  await Process.run('rm', ['-rf', '.dart_tool'], runInShell: Platform.isWindows);
  await Process.run(
    'dart',
    ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
    runInShell: Platform.isWindows,
  );
}
