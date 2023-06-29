import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:kontakt_unikovka/state/cipher_status.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/data/constants.dart';
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
        create: (_) => CipherManager(FINAL_TIME),
        child: const ScreenSelector(),
      ),
    );
  }
}
