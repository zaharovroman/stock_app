import 'package:flutter/material.dart';
import 'package:stock_app/app_provider.dart';
import 'package:stock_app/presentation/home/home_screen.dart';

void main() {
  runApp(
    const AppProvider(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
