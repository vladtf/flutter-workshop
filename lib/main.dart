import 'package:flutter/material.dart';

import 'views/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF4DB5E4),
        accentColor: const Color(0xFF43ACCD),
      ),
      home: MainPage(),
    );
  }
}
