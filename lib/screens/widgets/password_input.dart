import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/cipher_manager.dart';

class CipherInput extends StatefulWidget {
  @override
  _CipherInputState createState() => _CipherInputState();
}

class _CipherInputState extends State<CipherInput> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cipherManager = Provider.of<CipherManager>(context);

    var submitPassword = () {
      cipherManager.guessPassword(_controller.text);
      _controller.clear();
      print("Pressed send button, text: ${_controller.text}");
    };

    return Container(
        child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: (value) {
                  submitPassword();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Zadej heslo"),
              ),
            ),
            IconButton(
              icon: Icon(Icons.verified_rounded),
              onPressed: submitPassword,
            ),
          ],
        ),
      ),
      SizedBox(height: 16),
      Text(cipherManager.coordinates),
      SizedBox(height: 16),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: cipherManager.showHint,
              child: Text("Ukázat nápovědu")),
          SizedBox(width: 20),
          ElevatedButton(
              onPressed: cipherManager.showSolution,
              child: Text("Požádat o řešení")),
        ],
      ),
      SizedBox(height: 16),
      Text(cipherManager.hint),
    ]));
  }
}
