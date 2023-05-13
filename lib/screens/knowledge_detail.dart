import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kontakt_unikovka/screens/data/knowledge_data.dart';

class KnowledgeDetail extends StatelessWidget {
  final int index;

  KnowledgeDetail({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(knowledgeDatabase[index].title),
      ),
      body: Center(
        child: Column(
          children: [
            Text('You clicked item $index'),
            Text(knowledgeDatabase[index].content),
          ],
        ),
      ),
    );
  }
}

class MorseCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Seznam morseovky");
  }
}

class Semaphor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Obrazky semaforu");
  }
}
