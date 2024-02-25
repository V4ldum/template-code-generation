import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_generated/{{source_name.snakeCase()}}_data_source.g.dart';

@riverpod
{{source_name.pascalCase()}}DataSource {{source_name.camelCase()}}DataSource({{source_name.pascalCase()}}DataSourceRef ref) {
  return {{source_name.pascalCase()}}DataSource();
}

class {{source_name.pascalCase()}}DataSource {
  {{source_name.pascalCase()}}DataSource();

  // TODO(auto): methods
}
