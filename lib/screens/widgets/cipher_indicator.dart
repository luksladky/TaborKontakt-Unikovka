import 'package:flutter/material.dart';
import 'package:kontakt_unikovka/state/cipher_manager.dart';
import 'package:provider/provider.dart';

import '../../state/cipher_status.dart';

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
              decoration: BoxDecoration(
                  color: getCipherStateColor(cipherManager.ciphers[i].status),
                  border: cipherManager.activeCipherIndex == i
                      ? Border.all(color: Colors.black)
                      : null,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
              width: 20,
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Center(child: Text("$i")),
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
