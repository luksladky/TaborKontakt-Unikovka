const PENALTY_HINT = Duration(minutes: 20);
const PENALTY_SHOW_SOLUTION = Duration(minutes: 40);

DateTime currentDate = DateTime.now();
DateTime FINAL_TIME = DateTime(
  currentDate.year,
  currentDate.month,
  currentDate.day,
  17,
  30,
);

List<String> SMS_RECIPIENTS = ["724410215", "605554044"]; // TODO cisla

String buildSmsText(String event, Duration remaining) {
  return "Udalost: $event, zbyva do konce: ${remaining.inHours}:${remaining.inMinutes % 60}";
}