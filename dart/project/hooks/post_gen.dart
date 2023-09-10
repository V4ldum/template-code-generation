import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Running post_gen');

  await importPackages();
  await finalize();

  progress.complete();
}

Future<void> importPackages() async {
  // dependencies
  await Process.run('flutter', ['pub', 'add', 'dio'], runInShell: Platform.isWindows);
  await Process.run('flutter', ['pub', 'add', 'flutter_riverpod'], runInShell: Platform.isWindows);
  await Process.run('flutter', ['pub', 'add', 'json_annotation'], runInShell: Platform.isWindows);
  await Process.run('flutter', ['pub', 'add', 'intl'], runInShell: Platform.isWindows);
  await Process.run(
    'flutter',
    ['pub', 'add', 'meta_package', '--git-url=https://github.com/V4ldum/meta-package', '--git-ref=main'],
    runInShell: Platform.isWindows,
  );
  await Process.run(
    'flutter',
    ['pub', 'add', 'flutter_localizations', '--sdk=flutter'],
    runInShell: Platform.isWindows,
  );

  // dev dependencies
  await Process.run('flutter', ['pub', 'add', '--dev', 'build_runner'], runInShell: Platform.isWindows);
  await Process.run('flutter', ['pub', 'add', '--dev', 'custom_lint'], runInShell: Platform.isWindows);
  await Process.run('flutter', ['pub', 'add', '--dev', 'json_serializable'], runInShell: Platform.isWindows);
  await Process.run('flutter', ['pub', 'add', '--dev', 'riverpod_lint'], runInShell: Platform.isWindows);
  await Process.run('flutter', ['pub', 'add', '--dev', 'very_good_analysis'], runInShell: Platform.isWindows);
}

Future<void> finalize() async {
  await Process.run('mason', ['get'], runInShell: Platform.isWindows);
  await Process.run('flutter', ['pub', 'global', 'run', 'intl_utils:generate'], runInShell: Platform.isWindows);
}
