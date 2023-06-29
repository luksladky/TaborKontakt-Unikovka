import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kontakt_unikovka/screens/widgets/cipher_indicator.dart';
import 'package:provider/provider.dart';

import '../../state/cipher_manager.dart';

class CipherInput extends StatefulWidget {
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

    return Column(children: [
      const CipherIndicator(),
      Row(
        children: [
          Expanded(
            child: TextField(
                controller: _controller,
                textCapitalization: TextCapitalization.characters,
                onSubmitted: (value) {
                  submitPassword();
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Zadej heslo"),
                inputFormatters: [
                  UpperCaseTextFormatter(),
                ]),
          ),
          const SizedBox(width: 10),
          FilledButton(
            onPressed: submitPassword,
            child: const Icon(Icons.question_mark),
          ),
        ],
      ),
      const SizedBox(height: 16),
      Text(cipherManager.coordinates),
      const SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange)),
              onPressed: () async {
                if (await confirm(
                  context,
                  title: const Text("Opravdu chcete ukázat nápovědu?"),
                  content: const Text("Zkrátí se vám čas."),
                  textOK: const Text("Ukázat"),
                  textCancel: const Text("Zrušit"),
                )) {
                  cipherManager.showHint();
                }
              },
              child: Text("Ukázat nápovědu")),
          const SizedBox(width: 20),
          OutlinedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
              onPressed: () async {
                if (await confirm(
                  context,
                  title: const Text("Opravdu chcete ukázat řešení?"),
                  content: const Text("Zkrátí se vám čas."),
                  textOK: const Text("Ukázat"),
                  textCancel: const Text("Zrušit"),
                )) {
                  cipherManager.showSolution();
                  _controller.clear();
                }
              },
              child: Text("Požádat o řešení")),
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
