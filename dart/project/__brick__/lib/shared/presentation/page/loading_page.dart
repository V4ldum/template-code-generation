import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_package/meta_package.dart';
import 'package:{{project_name}}/shared/constant/app_asset.dart';
import 'package:{{project_name}}/shared/constant/app_component_size.dart';
import 'package:{{project_name}}/shared/presentation/provider/app_cache_controller.dart';
import 'package:{{project_name}}/shared/utils/go_router.dart';

class LoadingPage extends ConsumerWidget {
  const LoadingPage({
    super.key,
  });

  Future<void> _onInit(WidgetRef ref) async {
    final context = ref.context;

    await ref.read(appCacheControllerProvider.notifier).init();

    if (context.mounted) {
      // TODO(auto): navigation
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: InitCaller(
          postFrame: true,
          onInit: () => _onInit(ref),
          child: Center(
            child: Image.asset(
              AppAsset.logo,
              height: AppComponentSize.m,
            ),
          ),
        ),
      ),
    );
  }
}
