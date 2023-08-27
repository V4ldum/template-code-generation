import 'package:{{project_name}}/navigation/routes/no_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final {{page_name.camelCase()}}NavigatorProvider = Provider.autoDispose((ref) {
  return {{page_name.pascalCase()}}Navigator();
});

class {{page_name.pascalCase()}}Navigator with NoRoutes {
  {{page_name.pascalCase()}}Navigator();
}
