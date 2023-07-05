import 'package:isar/isar.dart';

part 'cipher_status.g.dart';

enum Solved { No, NoButHintDisplayed, YesWithHint, YesWithSolution, Yes }

@collection
class CipherStatus {
  final Id id = 0;

  @Enumerated(EnumType.name)
  final List<Solved> statuses;

  final int penaltyInMinutes;

  final DateTime lastSms;

  const CipherStatus(this.statuses, this.penaltyInMinutes, this.lastSms);

  Solved operator [](int i) => statuses[i];
}
