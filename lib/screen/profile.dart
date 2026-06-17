import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final Map<String, dynamic> student;

  const Profile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Profile")),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("Name: ${student['name']}", style: TextStyle(fontSize: 18)),

            Text("Email: ${student['email']}", style: TextStyle(fontSize: 18)),

            Text(
              "Course: ${student['course']}",

              style: TextStyle(fontSize: 18),
            ),

            Text("Year: ${student['year']}", style: TextStyle(fontSize: 18)),

            Text("Phone: ${student['phone']}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
