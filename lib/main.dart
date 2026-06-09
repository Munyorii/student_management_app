import 'package:flutter/material.dart';
import 'package:student_management/screen/dashboard.dart';
import 'package:student_management/screen/login_screen.dart';
import 'package:student_management/screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Manager',

      initialRoute: '/login',

      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/dashboard': (context) => Dashboard(),
      },
    );
  }
}
