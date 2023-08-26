import 'package:flutter/material.dart';
import 'task.dart';
import 'add_task_page.dart';

class TaskBoardPage extends StatefulWidget {
  @override
  _TaskBoardPageState createState() => _TaskBoardPageState();
}

class _TaskBoardPageState extends State<TaskBoardPage> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background color white
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        //background color  black
        backgroundColor: Colors.black,
        title: Text(
          'Task Board',

          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true, // Center the title in the app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var task in tasks) _buildTaskCard(task),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () async {
          Task newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTaskCard(Task task) {
    return Card(
      elevation: 3,
      child: Padding(

        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    task.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(task.description),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '${_formatTime(task.time)} ${_formatDate(task.date)}',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    return '${dateTime.day} ${_getMonthName(dateTime.month)}, ${dateTime.year}';
  }

  String _getMonthName(int month) {
    List<String> monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }

  String _formatTime(String time) {
    DateTime dateTime = DateTime.parse('2023-08-01 $time');
    String period = 'AM';
    if (dateTime.hour >= 12) {
      period = 'PM';
      dateTime = dateTime.add(Duration(hours: -12));
    }
    if (dateTime.hour == 0) dateTime = dateTime.add(Duration(hours: 12));
    String formattedHour = dateTime.hour.toString().padLeft(2, '0');
    String formattedMinute = dateTime.minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute $period';
  }
}
