import 'package:go_router/go_router.dart';
import 'package:smartspace_client/ui/responsive/screens/login_screen.dart';
import 'package:smartspace_client/ui/shared/splash/splash_screen.dart';
import 'package:smartspace_client/ui/responsive/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
  ],
);
