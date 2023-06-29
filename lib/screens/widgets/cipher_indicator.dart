import 'package:flutter/material.dart';
import 'package:kontakt_unikovka/state/cipher_manager.dart';
import 'package:provider/provider.dart';

import '../data/cipher_status.dart';

class CipherIndicator extends StatelessWidget {
  const CipherIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CipherManager>(builder: (context, cipherManager, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < cipherManager.ciphers.length; i++)
            Container(
              color: getCipherStateColor(cipherManager.ciphers[i].status),
              width: 20,
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text("$i"),
            )
        ],
      );
    });
  }

  Color getCipherStateColor(Solved status) {
    switch (status) {
      case Solved.Yes:
        return Colors.green;
      case Solved.YesWithHint:
        return Colors.yellow;
      case Solved.YesWithSolution:
        return Colors.black38;
      default:
        return Colors.black12;
    }
  }
}
