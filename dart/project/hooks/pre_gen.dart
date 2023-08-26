import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running pre_gen');

  context.vars = {
    ...context.vars,
    ...await getInformations(),
  };
  await removeFiles();
  await addMasonToGitignore();

  progress.complete();
}

Future<Map<String, String>> getInformations() async {
  final f = File('pubspec.yaml');
  final lines = await f.readAsLines();

  final sdkLine = lines.firstWhere((line) => line.contains('sdk:'));
  final projectLine = lines.firstWhere((line) => line.contains('name:'));

  return {
    'sdk_lower_bound': sdkLine.split(": '>=")[1].split(' <')[0],
    'sdk_upper_bound': sdkLine.split(": '>=")[1].split(' <')[1].replaceAll("'", ''),
    'project_name': projectLine.split(': ')[1],
  };
}

Future<void> removeFiles() async {
  await Process.run('rm', ['pubspec.yaml']);
  await Process.run('rm', ['analysis_options.yaml']);
  await Process.run('rm', ['mason.yaml']);
  await Process.run('rm', ['lib/main.dart']);
}

Future<void> addMasonToGitignore() async {
  final f = File('.gitignore');
  final lines = await f.readAsLines();

  final out = [
    ...lines,
    '',
    '# Mason',
    '.mason/',
  ];

  await f.writeAsString(out.join('\n'));
}
