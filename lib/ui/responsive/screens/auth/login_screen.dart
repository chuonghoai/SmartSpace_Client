import 'package:flutter/material.dart';
import 'package:smartspace_client/features/auth/controller/login_controller.dart';
import 'package:smartspace_client/ui/mobile/auth/login_screen.dart';
import 'package:smartspace_client/ui/responsive/responsive_layout.dart';
import 'package:smartspace_client/ui/web/auth/login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginController _controller;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _controller = LoginController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return ResponsiveLayout(
          mobile: MobileLoginScreen(
            controller: _controller,
            emailController: _emailController,
            passwordController: _passwordController,
            rememberMe: _rememberMe,
            onRememberMeChanged: (value) {
              setState(() {
                _rememberMe = value ?? false;
              });
            },
          ),
          web: WebLoginScreen(
            controller: _controller,
            emailController: _emailController,
            passwordController: _passwordController,
            rememberMe: _rememberMe,
            onRememberMeChanged: (value) {
              setState(() {
                _rememberMe = value ?? false;
              });
            },
          ),
        );
      },
    );
  }
}
