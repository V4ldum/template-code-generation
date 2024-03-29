import 'dart:io';

import 'package:mason/mason.dart';

const String featureNameKey = 'feature_name';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running pre_gen');
  final featureName = context.vars[featureNameKey] as String;

  await clearGitKeep(featureName.snakeCase);

  progress.complete();
}

Future<void> clearGitKeep(String featureName) async {
  await Process.run('rm', ['lib/feature/$featureName/data/data_source/.gitkeep'], runInShell: Platform.isWindows);
}
