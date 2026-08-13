import 'package:flutter/material.dart';

class MobileCompleteProfileScreen extends StatelessWidget {
  const MobileCompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Profile'),
      ),
      body: const Center(
        child: Text(
          'Please complete your profile information.\n[TODO]',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
