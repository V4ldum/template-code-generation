import 'package:json_annotation/json_annotation.dart';
import 'package:meta_package/meta_package.dart';

part 'generated/{{dto_name.snakeCase()}}_dto.g.dart';

@JsonSerializable()
class {{dto_name.pascalCase()}}Dto {
  {{dto_name.pascalCase()}}Dto();

  factory {{dto_name.pascalCase()}}Dto.fromJson(JsonResponse json) => _${{dto_name.pascalCase()}}DtoFromJson(json);

  factory {{dto_name.pascalCase()}}Dto.fromHttpResponse(JsonResponse response) {
    return {{dto_name.pascalCase()}}Dto.fromJson(response);
  }

  JsonResponse toJson() => _${{dto_name.pascalCase()}}DtoToJson(this);
}
