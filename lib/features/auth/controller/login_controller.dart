import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartspace_client/core/constants/registration_status.dart';
import 'package:smartspace_client/features/auth/services/auth_service.dart';

class LoginController extends ChangeNotifier {
  final AuthService _authService;

  LoginController({AuthService? service}) : _authService = service ?? authService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    if (_isLoading) return;

    if (email.trim().isEmpty || password.isEmpty) {
      _error = 'Please enter email and password';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await _authService.login(email.trim(), password, rememberMe);

      if (response.success && response.data != null) {
        final registrationStatus = response.data!.registrationStatus;
        if (context.mounted) {
          if (registrationStatus == ERegistrationStatus.completed) {
            context.go('/home');
          } else {
            context.go('/complete-profile');
          }
        }
      } else {
        _error = response.message.isNotEmpty ? response.message : 'Login failed. Please try again.';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
