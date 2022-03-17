import 'package:flutter/material.dart';

import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  final tabs = const [
    HomeScreen(),
    FavouriteScreen(),
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        body: widget.tabs[_currentTab],
        bottomNavigationBar: Builder(
          builder: (context) {
            return BottomNavigationBar(
              currentIndex: _currentTab,
              onTap: (value) {
                setState(() {
                  _currentTab = value;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'List',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favourite',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
