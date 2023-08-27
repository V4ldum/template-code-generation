import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta_package/meta_package.dart';
import 'package:{{project_name}}/features/{{feature_name.snakeCase()}}/presentation/page/{{page_name.snakeCase()}}/{{page_name.snakeCase()}}_navigator.dart';
import 'package:{{project_name}}/navigation/app_navigator.dart';

final {{page_name.camelCase()}}ControllerProvider = Provider.autoDispose((ref) {
  final navigator = ref.read({{page_name.camelCase()}}NavigatorProvider);

  return {{page_name.pascalCase()}}Controller(navigator);
});

class {{page_name.pascalCase()}}Controller extends BaseController {
  {{page_name.pascalCase()}}Controller(this.navigator);

  final {{page_name.pascalCase()}}Navigator navigator;
}
