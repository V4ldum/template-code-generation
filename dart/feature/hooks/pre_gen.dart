import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running pre_gen');

  await clearGitKeep();

  progress.complete();
}

Future<void> clearGitKeep() async {
  await Process.run('rm', ['lib/feature/.gitkeep'], runInShell: Platform.isWindows);
  await Process.run('rm', ['test/feature/.gitkeep'], runInShell: Platform.isWindows);
}
