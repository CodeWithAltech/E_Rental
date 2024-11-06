import 'package:flutter/material.dart';

class ConnectivityScreen extends StatelessWidget {
  const ConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Internet'),
      ),
    );
  }
}
