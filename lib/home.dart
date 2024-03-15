import 'package:flutter/material.dart';
import 'package:sgp/SolutionPage.dart';
import 'package:sgp/ScanPage.dart';
import 'package:sgp/NotificationPage.dart';

class Home extends StatefulWidget {
  final String language; // Add language parameter to the Home widget

  const Home({Key? key, required this.language}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions(BuildContext context, String language) {
    return <Widget>[
      SolutionPage(language: language),
      ScanPage(language: language),
      NotificationPage(language: language),
    ];
  }

  static const List<IconData> _tabIcons = <IconData>[
    Icons.article,
    Icons.camera_alt,
    Icons.notifications,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions(context, widget.language).elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_tabIcons[0]),
            label: widget.language == 'eng' ? 'Solution' : 'સમાધાન',
          ),
          BottomNavigationBarItem(
            icon: Icon(_tabIcons[1]),
            label: widget.language == 'eng' ? 'Scan' : 'સ્કેન',
          ),
          BottomNavigationBarItem(
            icon: Icon(_tabIcons[2]),
            label: widget.language == 'eng' ? 'Notification' : 'સૂચના',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
