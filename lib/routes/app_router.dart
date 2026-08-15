import 'package:go_router/go_router.dart';
import 'package:smartspace_client/routes/router_path.dart';
import 'package:smartspace_client/ui/responsive/screens/auth/login_screen.dart';
import 'package:smartspace_client/ui/shared/splash/splash_screen.dart';
import 'package:smartspace_client/ui/responsive/screens/home/home_screen.dart';
import 'package:smartspace_client/ui/responsive/screens/auth/complete_profile_screen.dart';

import 'package:smartspace_client/ui/responsive/screens/auth/register_email_screen.dart';
import 'package:smartspace_client/ui/responsive/screens/auth/register_otp_screen.dart';
import 'package:smartspace_client/ui/responsive/screens/auth/register_password_screen.dart';

final appRouter = GoRouter(
  initialLocation: RouterPath.splash,
  routes: [
    GoRoute(
      path: RouterPath.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouterPath.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RouterPath.registerEmail,
      builder: (context, state) => const RegisterEmailScreen(),
    ),
    GoRoute(
      path: RouterPath.registerOtp,
      builder: (context, state) => const RegisterOtpScreen(),
    ),
    GoRoute(
      path: RouterPath.registerPassword,
      builder: (context, state) => const RegisterPasswordScreen(),
    ),
    GoRoute(
      path: RouterPath.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RouterPath.completeProfile,
      builder: (context, state) => const CompleteProfileScreen(),
    ),
  ],
);
