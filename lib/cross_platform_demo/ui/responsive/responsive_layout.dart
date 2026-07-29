import 'package:flutter/material.dart';
import '../../data/location_repository.dart';
import '../mobile/mobile_home_screen.dart';
import '../web/web_home_screen.dart';
class ResponsiveLayout extends StatelessWidget {
  final LocationRepository repository;

  const ResponsiveLayout({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return WebHomeScreen(repository: repository);
        } else {
          return MobileHomeScreen(repository: repository);
        }
      },
    );
  }
}
