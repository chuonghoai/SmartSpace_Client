import 'package:flutter/material.dart';
import 'data/location_repository.dart';
import 'ui/responsive/responsive_layout.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedRepository = LocationRepository();

    return MaterialApp(
      title: 'Smart Space',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: ResponsiveLayout(repository: sharedRepository),
    );
  }
}
