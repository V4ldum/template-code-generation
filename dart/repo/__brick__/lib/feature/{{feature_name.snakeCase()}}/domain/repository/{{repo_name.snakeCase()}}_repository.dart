import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_generated/{{repo_name.snakeCase()}}_repository.g.dart';

@riverpod
{{repo_name.pascalCase()}}Repository {{repo_name.camelCase()}}Repository({{repo_name.pascalCase()}}RepositoryRef ref) {
  return {{repo_name.pascalCase()}}Repository(ref);
}

class {{repo_name.pascalCase()}}Repository {
  {{repo_name.pascalCase()}}Repository(this._ref);

  final {{repo_name.pascalCase()}}RepositoryRef _ref;

  // TODO(auto): attributes & methods
}
