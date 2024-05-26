// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:codacy_test_project/main.dart'; // Update this to the correct import path

void main() {
  testWidgets('CalculatorApp displays initial state', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    // Verify that '0' is displayed initially
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('CalculatorApp updates display on button press', (WidgetTester tester) async {
    await tester.pumpWidget(CalculatorApp());

    // Tap '1' button
    await tester.tap(find.text('1'));
    await tester.pump();

    // Verify that '1' is displayed
    expect(find.text('1'), findsOneWidget);

    // Tap '2' button
    await tester.tap(find.text('2'));
    await tester.pump();

    // Verify that '12' is displayed
    expect(find.text('12'), findsOneWidget);
  });

  // Add more tests as needed
}
