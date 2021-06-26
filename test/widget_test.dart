// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_workshop/main.dart';
import 'package:flutter_workshop/providers/data_provider.dart';
import 'package:flutter_workshop/views/edit_page.dart';
import 'package:flutter_workshop/views/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Test existing widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MyApp(),
    ));

    // Verify pie chart data
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('React'), findsOneWidget);
    expect(find.text('Xamarin'), findsOneWidget);
    expect(find.text('Ionic'), findsOneWidget);
  });

  testWidgets('Test navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => DataProvider(),
      child: MyApp(),
    ));

    // Test navigation
    expect(find.byType(MainPage), findsOneWidget);
    expect(find.byType(EditPage), findsNothing);

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();

    expect(find.byType(MainPage), findsNothing);
    expect(find.byType(EditPage), findsOneWidget);

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(find.byType(MainPage), findsOneWidget);
    expect(find.byType(EditPage), findsNothing);
  });

  testWidgets('Test edit', (WidgetTester tester) async {
    DataProvider provider = DataProvider();
    Map<String, double> dataMap = provider.dataMap;

    // Test initial data
    expect(dataMap['Flutter'], equals(5));
    expect(dataMap['React'], equals(3));
    expect(dataMap['Xamarin'], equals(2));
    expect(dataMap['Ionic'], equals(2));

    // Build our app and trigger a frame.
    await tester.pumpWidget(ChangeNotifierProvider(
      create: (context) => provider,
      child: MyApp(),
    ));

    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();

    var flutterValueField = find.widgetWithText(TextFormField, "5.0");

    var newValue = "10";

    await tester.enterText(flutterValueField, newValue);

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(dataMap['Flutter'], equals(double.parse(newValue)));
    expect(dataMap['React'], equals(3));
    expect(dataMap['Xamarin'], equals(2));
    expect(dataMap['Ionic'], equals(2));
  });
}
