import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import '../../data/location_repository.dart';
import '../mobile/mobile_home_screen.dart';
import '../web/web_home_screen.dart';

/// This widget decides which UI to show based on the platform or screen size.
/// 
/// We demonstrate two concepts here:
/// 1. Platform-specific UI using `kIsWeb`
/// 2. Responsive UI using `MediaQuery` (for cases where you resize browser window)
class ResponsiveLayout extends StatelessWidget {
  final LocationRepository repository;

  const ResponsiveLayout({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    // Approach 1: Strict Platform Check
    // If it's running on a web browser, show Web UI, otherwise Mobile UI.
    // Uncomment this to test strict platform-based routing:
    /*
    if (kIsWeb) {
      return WebHomeScreen(repository: repository);
    } else {
      return MobileHomeScreen(repository: repository);
    }
    */

    // Approach 2: Responsive Check (More flexible, recommended for Web/Desktop)
    // If the screen is wide enough, show Web UI, even if it's a large tablet app.
    // If it's small, show Mobile UI, even if it's a resized web browser window.
    return LayoutBuilder(
      builder: (context, constraints) {
        // 800 is a common breakpoint for Tablet/Desktop vs Mobile
        if (constraints.maxWidth > 800) {
          // Both screens get exactly the SAME repository instance. 
          // The Business/Data layer is completely shared.
          return WebHomeScreen(repository: repository);
        } else {
          return MobileHomeScreen(repository: repository);
        }
      },
    );
  }
}
