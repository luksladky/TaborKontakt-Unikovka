import 'package:flutter/material.dart';

import 'widgets/countdown_timer.dart';
import 'widgets/cipher_controls.dart';

class CipherManagerScreen extends StatefulWidget {
  const CipherManagerScreen({Key? key}) : super(key: key);

  @override
  State<CipherManagerScreen> createState() => _CipherManagerScreenState();
}

class _CipherManagerScreenState extends State<CipherManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: CountdownTimer(),
        ),
        CipherInput(),
      ]),
    );
  }
}
