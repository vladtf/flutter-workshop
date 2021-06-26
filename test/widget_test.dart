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
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
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
}
