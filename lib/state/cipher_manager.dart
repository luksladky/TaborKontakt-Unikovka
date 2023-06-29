import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:kontakt_unikovka/screens/data/ciphers.dart';
import 'package:kontakt_unikovka/screens/data/constants.dart';
import 'package:kontakt_unikovka/state/cipher_status.dart';

class CipherManager with ChangeNotifier, DiagnosticableTreeMixin {
  final DateTime finalTime;

  late Timer _timer;
  late Duration _remainingTime;
  late Duration _timePenalty;

  late int _cipherIndex;
  late List<Cipher> _ciphers;

  late Isar _isar;

  CipherManager(this.finalTime) {
    _isar = GetIt.instance.get<Isar>();
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
    _timePenalty = Duration.zero;
    _cipherIndex = 0;
    _ciphers = buildCipherData();
    final status = _isar.cipherStatus.getSync(0);
    if (status != null) {
      _timePenalty = Duration(minutes: status.penaltyInMinutes);
      for (int i = 0; i < _ciphers.length; ++i) {
        _ciphers[i].status = status[i];
      }
    }
  }

  DateTime get counterFinalTime => finalTime;

  Duration get remainingTime => _remainingTime - _timePenalty;

  Cipher get activeCipher => _ciphers[_cipherIndex];

  int get activeCipherIndex => _cipherIndex;

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
      _isar.writeTxnSync(() {
        _isar.cipherStatus.clearSync();
      });
      init();
      notifyListeners();
    }
    if (password == currentPassword) {
      nextCipher();
      var cipherStatus = CipherStatus(_ciphers.map((c) => c.status).toList(), _timePenalty.inMinutes);
      _isar.writeTxnSync(() {
        _isar.cipherStatus.putSync(cipherStatus);
      });
    }
  }

  void showHint() {
    if (activeCipher.status == Solved.No) {
      activeCipher.status = Solved.NoButHintDisplayed;
      _timePenalty += PENALTY_HINT;
      notifyListeners();
    }
  }

  void showSolution() {
    activeCipher.status = Solved.YesWithSolution;
    _timePenalty += PENALTY_SHOW_SOLUTION;
    nextCipher();
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

class Cipher {
  String password;

  String coordinates;
  String hint;

  Solved status = Solved.No;

  Cipher({required this.password, required this.coordinates, required this.hint});
}
