import 'package:isar/isar.dart';

part 'cipher_status.g.dart';

enum Solved { No, NoButHintDisplayed, YesWithHint, YesWithSolution, Yes }

@collection
class CipherStatus {
  final Id id = 0;

  @Enumerated(EnumType.name)
  final List<Solved> statuses;

  final int penaltyInMinutes;

  const CipherStatus(this.statuses, this.penaltyInMinutes);

  Solved operator [](int i) => statuses[i];
}
