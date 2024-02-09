import 'package:find_pet/screens/initial_screen.dart';
import 'package:find_pet/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

