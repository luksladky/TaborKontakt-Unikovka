import 'package:flutter/material.dart';

class CipherManagerScreen extends StatefulWidget {
  const CipherManagerScreen({Key? key}) : super(key: key);

  @override
  State<CipherManagerScreen> createState() => _CipherManagerScreenState();
}

class _CipherManagerScreenState extends State<CipherManagerScreen> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Index 0: Countdown',
        style: optionStyle,
      ),
    );
  }
}
