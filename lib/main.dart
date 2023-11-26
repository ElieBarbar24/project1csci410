import 'package:flutter/material.dart';
import 'package:project1csci410/Pages/SelectQuantities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SelectQuantities(),
    );
  }
}

