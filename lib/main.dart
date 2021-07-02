import 'package:flutter/material.dart';
import 'package:flutter_workshop/providers/data_provider.dart';
import 'package:flutter_workshop/providers/firebase_data_provider.dart';
import 'package:flutter_workshop/utils/routes.dart';
import 'package:preferences/preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  await loadPreferences();

  runApp(ChangeNotifierProvider(
    create: (context) => FirebaseDataProvider(),
    child: MyApp(),
  ));
}

Future loadPreferences() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PrefService.init();

  // PrefService.setDefaultValues({
  //   'data_map_keys': ['Flutter', 'React', 'Xamarin', 'Ionic'],
  //   'data_map_values': ['5', '3', '2', '2'],
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Workshop',
        theme: ThemeData(
          primaryColor: Color(0xFF4DB5E4),
          accentColor: Color(0xFF43ACCD),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: Routes.routes());
  }
}
