import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_generated/{{service_name.snakeCase()}}_service.g.dart';

@riverpod
{{service_name.pascalCase()}}Service {{service_name.camelCase()}}Service({{service_name.pascalCase()}}ServiceRef ref) {
  return {{service_name.pascalCase()}}Service();
}

class {{service_name.pascalCase()}}Service {
  {{service_name.pascalCase()}}Service();

  // TODO(auto): attributes & methods
}
