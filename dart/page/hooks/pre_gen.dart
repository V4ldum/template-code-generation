import 'dart:io';

import 'package:mason/mason.dart';

const String featureNameKey = 'feature_name';
const String projectNameKey = 'project_name';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running pre_gen');
  final featureName = context.vars[featureNameKey] as String;

  await clearGitKeep(featureName);
  context.vars = {
    ...context.vars,
    projectNameKey: await getProjectName(),
  };

  progress.complete();
}

Future<void> clearGitKeep(String featureName) async {
  await Process.run('rm', ['lib/feature/$featureName/presentation/page/.gitkeep'], runInShell: Platform.isWindows);
}

Future<String> getProjectName() async {
  final f = File('pubspec.yaml');
  final lines = await f.readAsLines();

  final projectLine = lines.firstWhere((line) => line.contains('name:'));

  return projectLine.split(': ')[1];
}
