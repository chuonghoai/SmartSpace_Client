import 'package:flutter/material.dart';

class WebCompleteProfileScreen extends StatelessWidget {
  const WebCompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Please complete your profile information.\n[TODO]',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
