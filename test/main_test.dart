import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task_board_app/main.dart'; // Adjust the import path according to your package structure

void main() {
  testWidgets('Welcome page to TaskBoardPage transition test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Build our app and trigger a frame.
    await tester.pumpWidget(TaskBoardApp()); //

    // Verify that the welcome text is displayed.
    expect(find.text('Welcome to TaskBoard'), findsOneWidget);

    // Tap the 'Get Started' button and trigger a frame.
    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle(); // Wait for navigation transition to complete.

    // Verify that the TaskBoardPage is displayed.
    expect(find.text('Task Board'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}

