import 'package:firsty/common/loading_page.dart';
import 'package:firsty/common/rounded_small_button.dart';
import 'package:firsty/constants/constants.dart';
import 'package:firsty/features/auth/controller/auth_controller.dart';
import 'package:firsty/features/auth/view/signup_view.dart';
import 'package:firsty/features/auth/widgets/auth_field.dart';
import 'package:firsty/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void onLogin() {
    ref.read(authControllerProvider.notifier).login(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: appbar,
      body: isLoading
          ? const Loader()
          : Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    // Textfield 1
                    AuthField(
                      controller: emailController,
                      hintText: 'Email',
                      passwordType: false,
                    ),
                    const SizedBox(height: 25),
                    // Textfield 2
                    AuthField(
                      controller: passwordController,
                      hintText: 'Password',
                      passwordType: true,
                    ),
                    const SizedBox(height: 40),
                    // Button
                    Align(
                      alignment: Alignment.topRight,
                      child: RoundedSmallButton(
                        onTap: onLogin,
                        label: 'Done',
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Textspan
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Pallete.greyColor,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: const TextStyle(
                              color: Pallete.blueColor,
                              fontSize: 16,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  SignUpView.route(),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
