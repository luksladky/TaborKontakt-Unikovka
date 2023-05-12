import 'dart:async';

import 'package:flutter/foundation.dart';

class CipherManager with ChangeNotifier, DiagnosticableTreeMixin {
  final DateTime finalTime;

  late Timer _timer;
  late Duration _remainingTime;

  int _cipherIndex = 0;

  CipherManager(this.finalTime) {
    _remainingTime = finalTime.difference(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime.inSeconds > 0) {
        _remainingTime -= const Duration(seconds: 1);
      } else {
        timer.cancel();
      }
      notifyListeners();
    });
  }

  DateTime get counterFinalTime => finalTime;

  Duration get remainingTime => _remainingTime;

  void nextCipher() {
    if (_cipherIndex < cipherData.length - 1) {
      _cipherIndex++;
    }
    notifyListeners();
  }

  bool guessPassword(String password) {
    if (password != cipherData[_cipherIndex + 1].password) {
      print("Spatne heslo ${password}");
      return false;
    }

    nextCipher();
    return true;
  }

  String getCoordinates() {
    return cipherData[_cipherIndex].coordinates;
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('cipherIndex', _cipherIndex));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class CipherData {
  String password;
  String coordinates;

  CipherData(this.password, this.coordinates);
}

final List<CipherData> cipherData = [
  CipherData("", "Souradnice prvniho stanoviste"),
  CipherData("citron", "jdete na sever"),
  CipherData("pomeranc", "jdete na jih")
];
