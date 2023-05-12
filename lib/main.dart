import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/screen_selector.dart';
import 'state/cipher_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: ChangeNotifierProvider(
        create: (_) => CipherManager(
            DateTime.now().add(Duration(hours: 2, minutes: 30, seconds: 0))),
        child: const ScreenSelector(),
      ),
    );
  }
}
