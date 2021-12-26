import 'package:flutter/material.dart';

class Initialize extends StatelessWidget {
  const Initialize({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      child: Initialize(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
