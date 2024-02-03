import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta_package/meta_package.dart';

part '_generated/{{dto_name.snakeCase()}}_dto.freezed.dart';
part '_generated/{{dto_name.snakeCase()}}_dto.g.dart';

@freezed
sealed class {{dto_name.pascalCase()}}Dto with _${{dto_name.pascalCase()}}Dto {
  const factory {{dto_name.pascalCase()}}Dto(
    // TODO(auto): freezed parameters (with {})
  ) = _{{dto_name.pascalCase()}}Dto;

  factory {{dto_name.pascalCase()}}Dto.fromJson(JsonResponse json) => _${{dto_name.pascalCase()}}DtoFromJson(json);

  factory {{dto_name.pascalCase()}}Dto.fromHttpResponse(JsonResponse response) {
    return {{dto_name.pascalCase()}}Dto.fromJson(response);
  }
}
