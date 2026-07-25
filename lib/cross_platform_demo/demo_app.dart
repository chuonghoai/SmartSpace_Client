import 'package:flutter/material.dart';
import 'data/location_repository.dart';
import 'ui/responsive/responsive_layout.dart';

/// The entry point for the Cross-Platform Demo.
class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Instantiate the shared repository ONCE at the top level of the demo
    final sharedRepository = LocationRepository();

    return MaterialApp(
      title: 'SmartSpace Cross-Platform Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // The ResponsiveLayout will decide whether to show Mobile or Web UI
      home: ResponsiveLayout(repository: sharedRepository),
    );
  }
}
