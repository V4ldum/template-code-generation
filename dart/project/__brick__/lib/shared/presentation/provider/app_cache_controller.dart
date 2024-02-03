// ignore_for_file: avoid_final_parameters
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta_package/meta_package.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_generated/app_cache_controller.freezed.dart';
part '_generated/app_cache_controller.g.dart';

@unfreezed
sealed class AppCache with _$AppCache {
  factory AppCache(
      // TODO(auto): parameters
      ) = _AppCache;

  factory AppCache.fromJson(JsonResponse json) => _$AppCacheFromJson(json);
}

@Riverpod(keepAlive: true)
class AppCacheController extends _$AppCacheController {
  @override
  AppCache build() => AppCache();

  Future<void> init() async {
    // TODO(auto): init
  }
}
