import 'package:flutter/material.dart';
import 'task.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add Task'),
        centerTitle: true,
      ),
      body: Padding(

        padding: EdgeInsets.all(16.0),
        child: Column(

          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller : _dateController,
              decoration: InputDecoration(labelText: 'Date (yyyy-MM-dd)'),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Time (hh:mm)'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String description = _descriptionController.text;
                String date = _dateController.text;
                String time = _timeController.text;

                Navigator.pop(
                  context,
                  Task(
                    name: name,
                    description: description,
                    date: date,
                    time: time,
                  ),
                );
              },
              child:
                  //background color black
                  Text('Add Task'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              )

            ),
          ],
        ),
      ),
    );
  }
}
