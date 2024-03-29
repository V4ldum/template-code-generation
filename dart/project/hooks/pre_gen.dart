import 'dart:io';

import 'package:mason/mason.dart';

const String sdkLowerBoundKey = 'sdk_lower_bound';
const String sdkUpperBoundKey = 'sdk_upper_bound';
const String projectNameKey = 'project_name';
const String pathBuildKey = 'path';
const String fileBuildKey = 'file';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running pre_gen');

  context.vars = {
    ...context.vars,
    ...await getInformations(),
    pathBuildKey: '{{path}}', // fix to avoid deleting some mustache template from the build.yaml file
    fileBuildKey: '{{file}}', // fix to avoid deleting some mustache template from the build.yaml file
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
    sdkLowerBoundKey: sdkLine.split(": '>=")[1].split(' <')[0],
    sdkUpperBoundKey: sdkLine.split(": '>=")[1].split(' <')[1].replaceAll("'", ''),
    projectNameKey: projectLine.split(': ')[1],
  };
}

Future<void> removeFiles() async {
  await Process.run('rm', ['pubspec.yaml']);
  await Process.run('rm', ['README.md']);
  await Process.run('rm', ['analysis_options.yaml']);
  await Process.run('rm', ['mason.yaml']);
  await Process.run('rm', ['lib/main.dart']);
  await Process.run('rm', ['test/widget_test.dart']);
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
