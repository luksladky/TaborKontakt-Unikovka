import 'package:flutter/material.dart';

class CipherData {
  String password;
  String coordinates;

  CipherData(this.password, this.coordinates);
}

final List<CipherData> cipherData = [
  CipherData("", "Souradnice prvniho stanoviste"),
  CipherData("citron", "jdete na sever"),
  CipherData("pomeranc", "jdete na jih")
];

class CipherInput extends StatefulWidget {
  @override
  _CipherInputState createState() => _CipherInputState();
}

class _CipherInputState extends State<CipherInput> {
  TextEditingController _controller = TextEditingController();

  int cipherIndex = 0;

  void incrementCipherIndex(String password) {
    setState(() {
      if (password != cipherData[cipherIndex + 1].password) {
        print("Spatne heslo ${_controller.text}");
        return;
      }
      if (cipherIndex < cipherData.length - 1) {
        cipherIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
              incrementCipherIndex(_controller.text);
              print("Pressed send button, text: ${_controller.text}");
              // Add your desired action for the icon button here
            },
          ),
        ],
      ),
      SizedBox(height: 16),
      Text(cipherData[cipherIndex].coordinates)
    ]));
  }
}
