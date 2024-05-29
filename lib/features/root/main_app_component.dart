import 'package:flutter/material.dart';

class MainAppComponent extends StatelessWidget {
  const MainAppComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
