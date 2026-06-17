import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final db = DatabaseHelper();

  final email = TextEditingController();

  final password = TextEditingController();

  register() async {
    if (email.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Fill all fields")));

      return;
    }

    await db.registerUser(email.text, password.text);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Account created")));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),

      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: email,

              decoration: InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: password,

              obscureText: true,

              decoration: InputDecoration(labelText: "Password"),
            ),

            SizedBox(height: 20),

            ElevatedButton(onPressed: register, child: Text("Register")),
          ],
        ),
      ),
    );
  }
}
