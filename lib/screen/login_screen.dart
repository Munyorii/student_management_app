import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final db = DatabaseHelper();

  final email = TextEditingController();

  final password = TextEditingController();

  login() async {
    var user = await db.loginUser(email.text, password.text);

    if (user != null) {
      Navigator.pushReplacementNamed(context, "/dashboard");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email or password. Register first."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: email,

              decoration: const InputDecoration(labelText: "Email"),
            ),

            TextField(
              controller: password,

              obscureText: true,

              decoration: const InputDecoration(labelText: "Password"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: login, child: const Text("Login")),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },

              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
