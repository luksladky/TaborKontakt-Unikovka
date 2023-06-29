import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:kontakt_unikovka/screens/data/cipher_status.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/screen_selector.dart';
import 'state/cipher_manager.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getApplicationDocumentsDirectory();
  final isar = Isar.openSync(
    [CipherStatusSchema],
    directory: directory.path,
  );

  getIt.registerSingleton<Isar>(isar);
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
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => CipherManager(
            DateTime.now().add(Duration(hours: 2, minutes: 30, seconds: 0))),
        child: const ScreenSelector(),
      ),
    );
  }
}
