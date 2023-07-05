import 'package:flutter/material.dart';
import 'package:kontakt_unikovka/screens/data/knowledge_data.dart';
import 'package:kontakt_unikovka/screens/knowledge_detail.dart';

class KnowledgeBaseScreen extends StatefulWidget {
  const KnowledgeBaseScreen({Key? key}) : super(key: key);

  @override
  State<KnowledgeBaseScreen> createState() => _KnowledgeBaseScreenState();
}

class _KnowledgeBaseScreenState extends State<KnowledgeBaseScreen> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: knowledgeDatabase.length,
      itemBuilder: (context, index) {
    return ListTile(
      title: Text(knowledgeDatabase[index].title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KnowledgeDetail(index: index),
          ),
        );
      },
    );
      },
    );
  }
}
