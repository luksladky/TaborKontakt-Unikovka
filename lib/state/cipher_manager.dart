import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:kontakt_unikovka/screens/data/ciphers.dart';
import 'package:kontakt_unikovka/screens/data/constants.dart';
import 'package:kontakt_unikovka/state/cipher_status.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

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

  bool get isAllSolved => activeCipher.isSolved;

  int get activeCipherIndex => _cipherIndex;

  String get coordinates => activeCipher.coordinates;

  String get currentPassword => activeCipher.password;

  String get hint => isHintShowed ? activeCipher.hint : "";

  bool get isHintShowed => activeCipher.status == Solved.NoButHintDisplayed;

  List<Cipher> get ciphers => _ciphers;

  void nextCipher() {
    if (_cipherIndex < _ciphers.length) {
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
      if (_cipherIndex < _ciphers.length - 1) {
        _cipherIndex++;
      }
    }
    notifyListeners();
  }

  void guessPassword(String password) {
    if (password.toLowerCase() == "resetuj_appku") {
      _isar.writeTxnSync(() {
        _isar.cipherStatus.clearSync();
      });
      init();
      notifyListeners();
    }
    if (password.toLowerCase() == currentPassword.toLowerCase()) {
      nextCipher();
      var cipherStatus = CipherStatus(
          _ciphers.map((c) => c.status).toList(), _timePenalty.inMinutes);
      _isar.writeTxnSync(() {
        _isar.cipherStatus.putSync(cipherStatus);
      });
      _sendSMS(buildSMS("Sifra uhodnuta", remainingTime), SMS_RECIPIENTS);
    }
  }

  void showHint() {
    if (activeCipher.status == Solved.No) {
      activeCipher.status = Solved.NoButHintDisplayed;
      _timePenalty += PENALTY_HINT;
      notifyListeners();
      _sendSMS(buildSMS("Napoveda", remainingTime), SMS_RECIPIENTS);
    }
  }

  void showSolution() {
    activeCipher.status = Solved.YesWithSolution;
    _timePenalty += PENALTY_SHOW_SOLUTION;
    nextCipher();
    _sendSMS(buildSMS("Ukazano reseni", remainingTime), SMS_RECIPIENTS);
  }

  void _sendSMS(String message, List<String> recipents) async {
    var status = await Permission.sms.status;
    if (status.isDenied) {
      status = await Permission.sms.request();
    }

    Position? position = await _getCurrentPosition();
    String positionStr = _latLongDecToDmsStr(position);

    if (status == PermissionStatus.granted) {
      final result = await sendSMS(
              message: "$message, $positionStr",
              recipients: recipents,
              sendDirect: true)
          .catchError((onError) {
        return "SMS sending error";
      });
      debugPrint(result);
    }
  }

  Future<Position?> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return null;
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  String _decToDms(double decimal) {
    int degree = decimal.floor();
    double remainderMinutes = (decimal - degree) * 60;

    int minutes = remainderMinutes.floor();

    double remainderSeconds = (remainderMinutes - minutes) * 60;
    int seconds = remainderSeconds.floor();
    return "$degree°$minutes'$seconds\"";
  }

  String _latLongDecToDmsStr(Position? position) {
    if (position == null) return "neznama";

    return "Pozice: ${_decToDms(position.latitude)}N, ${_decToDms(position.longitude)}E";
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      debugPrint(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
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

  bool get isSolved =>
      status != Solved.No && status != Solved.NoButHintDisplayed;

  Cipher({required this.password, required this.coordinates, this.hint = ""});
}
