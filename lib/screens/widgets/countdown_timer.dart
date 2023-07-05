import 'package:flutter/material.dart';
import 'package:kontakt_unikovka/state/cipher_manager.dart';
import 'package:provider/provider.dart';

class CountdownTimer extends StatelessWidget {
  // styling
  final double? fontSize;
  final FontWeight? fontWeight;

  const CountdownTimer({
    super.key,
    this.fontSize = 48,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    final countdownManager = Provider.of<CipherManager>(context);
    final remainingTime = countdownManager.remainingTime;

    final hours = remainingTime.inHours.toString();
    final minutes =
        remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds =
        remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Text(
      '$hours:$minutes:$seconds',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
