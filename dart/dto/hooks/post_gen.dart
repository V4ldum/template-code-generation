import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running post_gen');

  await generateDto();

  progress.complete();
}

Future<void> generateDto() async {
  await Process.run('dart', ['run', 'build_runner', 'build'], runInShell: Platform.isWindows);
}
