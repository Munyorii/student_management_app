import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final db = DatabaseHelper();

  final name = TextEditingController();

  final email = TextEditingController();

  final course = TextEditingController();

  final year = TextEditingController();

  final phone = TextEditingController();

  save() async {
    await db.addStudent({
      "name": name.text,

      "email": email.text,

      "course": course.text,

      "year": year.text,

      "phone": phone.text,
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student")),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(labelText: "Name"),
            ),

            TextField(
              controller: email,
              decoration: InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: course,
              decoration: InputDecoration(labelText: "Course"),
            ),

            TextField(
              controller: year,
              decoration: InputDecoration(labelText: "Year"),
            ),

            TextField(
              controller: phone,
              decoration: InputDecoration(labelText: "Phone"),
            ),

            ElevatedButton(onPressed: save, child: Text("Save")),
          ],
        ),
      ),
    );
  }
}
