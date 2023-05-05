import 'package:flutter/material.dart';

import 'screens/screen_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kontakt únikovka',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const ScreenSelector(title: 'Kontakt'),
    );
  }
}
