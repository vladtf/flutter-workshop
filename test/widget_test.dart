// This is a basic Flutter widget test.
//
//     // Test navigation
//     expect(find.byType(MainPage), findsOneWidget);
//     expect(find.byType(EditPage), findsNothing);
//
//     await tester.tap(find.byIcon(Icons.edit));
//     await tester.pumpAndSettle();
//
//     expect(find.byType(MainPage), findsNothing);
//     expect(find.byType(EditPage), findsOneWidget);
//
//     await tester.tap(find.text("Save"));
//     await tester.pumpAndSettle();
//
//     expect(find.byType(MainPage), findsOneWidget);
//     expect(find.byType(EditPage), findsNothing);
//   });
//
//   testWidgets('Test edit', (WidgetTester tester) async {
//     DataProvider provider = DataProvider();
//     Map<String, double> dataMap = provider.dataMap;
//
//     // Test initial data
//     expect(dataMap['Flutter'], equals(5));
//     expect(dataMap['React'], equals(3));
//     expect(dataMap['Xamarin'], equals(2));
//     expect(dataMap['Ionic'], equals(2));
//
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(ChangeNotifierProvider(
//       create: (context) => provider,
//       child: MyApp(),
//     ));
//
//     await tester.tap(find.byIcon(Icons.edit));
//     await tester.pumpAndSettle();
//
//     var flutterValueField = find.widgetWithText(TextFormField, "5.0");
//
//     var newValue = "10";
//
//     await tester.enterText(flutterValueField, newValue);
//
//     await tester.tap(find.text("Save"));
//     await tester.pumpAndSettle();
//
//     expect(dataMap['Flutter'], equals(double.parse(newValue)));
//     expect(dataMap['React'], equals(3));
//     expect(dataMap['Xamarin'], equals(2));
//     expect(dataMap['Ionic'], equals(2));
//   });
// }
