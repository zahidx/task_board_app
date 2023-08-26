import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'task_board_page.dart';
import 'add_task_page.dart';

void main() {
  runApp(TaskBoardApp());
}

class TaskBoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/taskboard': (context) => TaskBoardPage(),
        '/addtask': (context) => AddTaskPage(),
      },
    );
  }
}
