import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'add_student.dart';
import 'profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DatabaseHelper db = DatabaseHelper();

  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();

    loadStudents();
  }

  void loadStudents() async {
    final data = await db.getStudents();

    setState(() {
      students = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Dashboard"), centerTitle: true),

      body: students.isEmpty
          ? const Center(child: Text("No students yet"))
          : ListView.builder(
              itemCount: students.length,

              itemBuilder: (context, index) {
                final student = students[index];

                return Card(
                  margin: const EdgeInsets.all(10),

                  child: ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.person)),

                    title: Text(student['name']),

                    subtitle: Text(
                      "${student['course']} - Year ${student['year']}",
                    ),

                    onTap: () {
                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => Profile(student: student),
                        ),
                      );
                    },
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () async {
          await Navigator.push(
            context,

            MaterialPageRoute(builder: (context) => const AddStudent()),
          );

          loadStudents();
        },
      ),
    );
  }
}
