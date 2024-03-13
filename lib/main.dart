import 'package:fibonacci_calculator/fibonacci_calculator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fibonacci Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FibonacciCalculator(),
    );
  }
}
