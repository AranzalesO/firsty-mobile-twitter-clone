import 'package:firsty/common/error_page.dart';
import 'package:firsty/common/loading_page.dart';
import 'package:firsty/features/auth/controller/auth_controller.dart';
import 'package:firsty/features/auth/home/view/home_view.dart';
import 'package:firsty/features/auth/view/signup_view.dart';
import 'package:firsty/pages/home.dart';
import 'package:firsty/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Firsty | Be the first to share to the world',
      theme: AppTheme.theme,
      home: ref.watch(currentUserAccountProvider).when(
          data: (user) {
            if (user != null) {
              return Home();
            }
            return const SignUpView();
          },
          error: (error, st) => ErrorPage(
                error: error.toString(),
              ),
          loading: () => const LoadingPage()),
    );
  }
}
