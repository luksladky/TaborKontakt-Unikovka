import 'dart:async';

import 'package:flutter/foundation.dart';

class CipherManager with ChangeNotifier, DiagnosticableTreeMixin {
  final DateTime finalTime;

  late Timer _timer;
  late Duration _remainingTime;

  int _cipherIndex = 0;
  List<CipherData> _ciphers = buildCipherData();

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

  CipherData get activeCipher => _ciphers[_cipherIndex];

  String get coordinates => activeCipher.coordinates;

  String get currentPassword => activeCipher.password;

  String get hint => isHintShowed ? activeCipher.hint : "";

  bool get isHintShowed => activeCipher.status == Solved.NoButHintDisplayed;

  void nextCipher() {
    if (_cipherIndex < _ciphers.length - 1) {
      switch (activeCipher.status) {
        case Solved.No:
          activeCipher.status = Solved.Yes;
          break;
        case Solved.NoButHintDisplayed:
          activeCipher.status = Solved.Yes;
          break;
      }
      _cipherIndex++;
    }
    notifyListeners();
  }

  void guessPassword(String password) {
    if (password == currentPassword) {
      nextCipher();
    }
  }

  void showHint() {
    if (activeCipher.status == Solved.No) {
      activeCipher.status = Solved.NoButHintDisplayed;
      notifyListeners();
    }
  }

  void showSolution() {
    activeCipher.status = Solved.YesWithSolution;
    nextCipher();
  }

  void penalizeTime() {
    //TODO different name and actually subtract from the finalTime
  }

  //currentCoordinatesunter` readable inside the devtools by listing all of its properties
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

enum Solved { No, NoButHintDisplayed, YesWithHint, YesWithSolution, Yes }

class CipherData {
  String password;

  String coordinates;
  String hint;

  Solved status = Solved.No;

  CipherData(this.password, this.coordinates, this.hint);
}

List<CipherData> buildCipherData() => [
      CipherData(
          "grep", "Souradnice prvniho stanoviste", "Zkus vylezt na strom"),
      CipherData("citron", "jdete na sever", "Podivej se do databaze"),
      CipherData(
          "pomeranc", "jdete na jih", "Tady be se hodilo znat morseovku.`")
    ];
