import 'package:flutter/material.dart';

import 'cipher_manager.dart';
import 'knowledge_base.dart';

class ScreenSelector extends StatefulWidget {
  const ScreenSelector({super.key, required this.title});

  final String title;

  @override
  State<ScreenSelector> createState() => _ScreenSelectorState();
}

class _ScreenSelectorState extends State<ScreenSelector> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CipherManagerScreen(),
    KnowledgeBaseScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
/*      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),*/
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            label: 'Zadávání hesel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Centrální mozek lidstva',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.lightGreenAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}