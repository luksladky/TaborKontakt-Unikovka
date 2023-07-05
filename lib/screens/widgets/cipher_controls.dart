import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kontakt_unikovka/screens/data/constants.dart';
import 'package:kontakt_unikovka/screens/widgets/cipher_indicator.dart';
import 'package:provider/provider.dart';

import '../../state/cipher_manager.dart';

class CipherInput extends StatefulWidget {
  const CipherInput({super.key});

  @override
  _CipherInputState createState() => _CipherInputState();
}

class _CipherInputState extends State<CipherInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cipherManager = Provider.of<CipherManager>(context);

    submitPassword() {
      cipherManager.guessPassword(_controller.text);
      _controller.clear();
      debugPrint("Pressed send button, text: ${_controller.text}");
    }

    if (cipherManager.remainingTime.inSeconds < 0) {
      return Column(
        children: [
          const Text(
              "Loď byla zničena. Vraťte se nejkratší cestou na základnu.",
              style: TextStyle(fontFamily: 'SourceCodePro')),
          const SizedBox(height: 16),
          buildTextField(submitPassword, "Terminál")
        ],
      );
    }

    if (cipherManager.isAllSolved) {
      return Column(
        children: [
          const Text(
            "Bezpečnostní systémy lodi jsou vyřazeny. Můžete vstoupit. Přibližně za dvě hodiny bude loď zničena. Pospěšte si.",
            style: TextStyle(fontFamily: 'SourceCodePro'),
          ),
          const SizedBox(height: 16),
          buildTextField(submitPassword, "Terminál")
        ],
      );
    } else {
      return Column(children: [
        const CipherIndicator(),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: buildTextField(submitPassword, "Zadej heslo"),
            ),
            const SizedBox(width: 10),
            FilledButton(
              onPressed: submitPassword,
              child: const Icon(Icons.question_mark),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          cipherManager.coordinates,
          style: const TextStyle(fontFamily: 'SourceCodePro'),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (cipherManager.hint.isNotEmpty)
              OutlinedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.orange)),
                  onPressed: () async {
                    if (await confirm(
                      context,
                      title: const Text("Opravdu chcete ukázat nápovědu?"),
                      content: Text(
                          "Zkrátí se vám čas o ${PENALTY_HINT.inMinutes}."),
                      textOK: const Text("Ukázat"),
                      textCancel: const Text("Zrušit"),
                    )) {
                      cipherManager.showHint();
                    }
                  },
                  child: const Text("Ukázat nápovědu")),
            const SizedBox(width: 20),
            OutlinedButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                onPressed: () async {
                  if (await confirm(
                    context,
                    title: const Text("Opravdu chcete ukázat úkol přeskočit?"),
                    content: Text(
                        "Zkrátí se vám čas o ${PENALTY_SHOW_SOLUTION.inMinutes} minut."),
                    textOK: const Text("Přeskočit"),
                    textCancel: const Text("Zrušit"),
                  )) {
                    cipherManager.showSolution();
                    _controller.clear();
                  }
                },
                child: const Text("Přeskočit úkol")),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          cipherManager.hint,
          style: const TextStyle(fontFamily: 'SourceCodePro'),
        ),
      ]);
    }
  }

  TextField buildTextField(Function submitPassword, String hintText) {
    return TextField(
        controller: _controller,
        textCapitalization: TextCapitalization.characters,
        onSubmitted: (value) {
          submitPassword();
        },
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: hintText),
        inputFormatters: [
          UpperCaseTextFormatter(),
        ]);
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
