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

    return Container(
        child: Column(children: [
      Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Zadej heslo"),
            ),
          ),
          IconButton(
            icon: Icon(Icons.verified_rounded),
            onPressed: () {
              cipherManager.guessPassword(_controller.text);
              print("Pressed send button, text: ${_controller.text}");
            },
          ),
        ],
      ),
      SizedBox(height: 16),
      Text(cipherManager.getCoordinates())
    ]));
  }
}
