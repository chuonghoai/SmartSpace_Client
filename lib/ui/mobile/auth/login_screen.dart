import 'package:flutter/material.dart';
import 'package:smartspace_client/features/auth/controller/login_controller.dart';
import 'package:smartspace_client/l10n/app_localizations.dart';
import '../../../core/localization/locale_provider.dart';

class MobileLoginScreen extends StatelessWidget {
  final LoginController controller;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool rememberMe;
  final ValueChanged<bool?> onRememberMeChanged;

  const MobileLoginScreen({
    super.key,
    required this.controller,
    required this.emailController,
    required this.passwordController,
    required this.rememberMe,
    required this.onRememberMeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.login),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final newLocale = localeProvider.locale.languageCode == 'vi'
                  ? const Locale('en')
                  : const Locale('vi');
              localeProvider.setLocale(newLocale);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (controller.error != null) ...[
              Text(
                controller.error!,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
            ],
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: l10n.email,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: l10n.password,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: controller.isLoading ? null : onRememberMeChanged,
                ),
                Text(l10n.rememberMe),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.isLoading
                  ? null
                  : () {
                      controller.login(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text,
                        rememberMe: rememberMe,
                      );
                    },
              child: controller.isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.login),
            ),
          ],
        ),
      ),
    );
  }
}
