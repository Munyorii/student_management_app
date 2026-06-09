import 'package:flutter/material.dart';
import '../data.dart';
import '../student.dart';

class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final courseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: courseController,
              decoration: const InputDecoration(labelText: "Course"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                students.add(
                  Student(
                    name: nameController.text,
                    email: emailController.text,
                    course: courseController.text,
                  ),
                );

                Navigator.pop(context);
              },
              child: const Text("Save Student"),
            ),
          ],
        ),
      ),
    );
  }
}
