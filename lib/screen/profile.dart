import 'package:flutter/material.dart';
import '../student.dart';

class Profile extends StatelessWidget {
  final Student student;

  const Profile({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Profile")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${student.name}"),
            const SizedBox(height: 10),

            Text("Email: ${student.email}"),
            const SizedBox(height: 10),

            Text("Course: ${student.course}"),
          ],
        ),
      ),
    );
  }
}
