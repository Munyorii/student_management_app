import 'package:flutter/material.dart';

import 'screen/login_screen.dart';
import 'screen/registration_screen.dart';
import 'screen/dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Student Manager",

      initialRoute: "/login",

      routes: {
        "/login": (context) => const LoginScreen(),

        "/register": (context) => const RegistrationScreen(),

        "/dashboard": (context) => const Dashboard(),
      },
    );
  }
}
