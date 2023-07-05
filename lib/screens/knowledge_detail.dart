import 'package:flutter/material.dart';
import 'package:kontakt_unikovka/screens/data/knowledge_data.dart';

class KnowledgeDetail extends StatelessWidget {
  final int index;

  const KnowledgeDetail({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(knowledgeDatabase[index].title),
      ),
      body: knowledgeDatabase[index].content(),
    );
  }
}
