import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class {{page_name.pascalCase()}}Page extends ConsumerWidget {
  const {{page_name.pascalCase()}}Page({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{page_name.pascalCase()}}'), // TODO(auto): Strings
      ),
      body: const SafeArea(
        child: Center(
          child: Text('{{page_name.pascalCase()}}'),
        ),
      ),
    );
  }
}
