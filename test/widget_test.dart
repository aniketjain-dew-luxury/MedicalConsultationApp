// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:medical_consultation_app/main.dart';
import 'package:medical_consultation_app/screens/tabbar_controller.dart';
import 'package:medical_consultation_app/screens/coming_soon.dart';

void main() {
  testWidgets('App Initialization Test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(const MedicalConsultationApp());
      await tester.pump(); // both pump() and pumpandsettle() works fine
    }).then((value) {
      // // Verify if the initial screen is rendered
      expect(find.byType(HomeTabBarScreen), findsOneWidget);
    });
  });

  testWidgets('Bottom navigation Bar should be 1', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(const MedicalConsultationApp());
      await tester.pump(); // both pump() and pumpandsettle() works fine
    }).then((value) {
      // Verify that there are one bottom navigation bar.
      expect(find.byType(BottomNavigationBar), findsOneWidget);
    });
  });

  testWidgets('BottomNavigationBarItem should be 5',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(const MedicalConsultationApp());
      await tester.pump(); // both pump() and pumpandsettle() works fine
    }).then((value) {
      // Find the BottomNavigationBar widget
      final bottomNavigationBar = find.byType(BottomNavigationBar);
      // Retrieve the actual widget
      final bottomNavigationBarWidget =
          tester.widget<BottomNavigationBar>(bottomNavigationBar);

      // Verify the number of items in the BottomNavigationBar
      expect(bottomNavigationBarWidget.items.length, 5);
    });
  });

  testWidgets('Tab Switching Test', (WidgetTester tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(const MedicalConsultationApp());
      await tester.pump(); // both pump() and pumpandsettle() works fine
    }).then((value) async {
      // Verify if the initial screen is rendered
      expect(find.byType(HomeTabBarScreen), findsOneWidget);

      // Tap on a different tab
      await tester.tap(find.text('Receipt'));
      await tester.pump();

      // Verify if the new screen is displayed
      expect(find.byType(ComingSoonScreen), findsOneWidget);
    });
  });
}
