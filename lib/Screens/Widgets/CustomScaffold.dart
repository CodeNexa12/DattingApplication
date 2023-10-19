import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  const CustomScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff0E0D0D), Color(0xff112220)],
          ),
        ),
        child: body,
      ),
    );
  }
}
