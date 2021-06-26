import 'package:flutter/material.dart';
import 'package:flutter_workshop/utils/routes.dart';
import 'package:flutter_workshop/views/main_page.dart';

import 'views/edit_page.dart';

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
          primaryColor: Color(0xFF4DB5E4),
          accentColor: Color(0xFF43ACCD),
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.routes());
  }
}
