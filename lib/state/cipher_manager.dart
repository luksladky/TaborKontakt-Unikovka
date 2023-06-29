import 'dart:async';

import 'package:flutter/foundation.dart';

class CipherManager with ChangeNotifier, DiagnosticableTreeMixin {
  final DateTime finalTime;

  late Timer _timer;
  late Duration _remainingTime;

  late int _cipherIndex;
  late List<Cipher> _ciphers;

  CipherManager(this.finalTime) {
    init();

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

  void init() {
    _cipherIndex = 0;
    _ciphers = _buildCipherData();
  }

  DateTime get counterFinalTime => finalTime;

  Duration get remainingTime => _remainingTime;

  Cipher get activeCipher => _ciphers[_cipherIndex];

  String get coordinates => activeCipher.coordinates;

  String get currentPassword => activeCipher.password;

  String get hint => isHintShowed ? activeCipher.hint : "";

  bool get isHintShowed => activeCipher.status == Solved.NoButHintDisplayed;

  List<Cipher> get ciphers => _ciphers;

  void nextCipher() {
    if (_cipherIndex < _ciphers.length - 1) {
      switch (activeCipher.status) {
        case Solved.No:
          activeCipher.status = Solved.Yes;
          break;
        case Solved.NoButHintDisplayed:
          activeCipher.status = Solved.YesWithHint;
          break;
        case Solved.YesWithHint:
        case Solved.YesWithSolution:
        case Solved.Yes:
          // nothing to do
          break;
      }
      _cipherIndex++;
    }
    notifyListeners();
  }

  void guessPassword(String password) {
    if (password == "resetuj_appku") {
      init();
    }
    if (password == currentPassword) {
      nextCipher();
    }
  }

  void showHint() {
    if (activeCipher.status == Solved.No) {
      activeCipher.status = Solved.NoButHintDisplayed;
      penalizeTime();
      notifyListeners();
    }
  }

  void showSolution() {
    activeCipher.status = Solved.YesWithSolution;
    penalizeTime();
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

class Cipher {
  String password;

  String coordinates;
  String hint;

  Solved status = Solved.No;

  Cipher(this.password, this.coordinates, this.hint);
}

List<Cipher> _buildCipherData() => [
      Cipher("grep", "Souradnice prvniho stanoviste", "Zkus vylezt na strom"),
      Cipher("citron", "jdete na sever", "Podivej se do databaze"),
      Cipher("pomeranc", "jdete na jih", "Tady be se hodilo znat morseovku.`")
    ];
