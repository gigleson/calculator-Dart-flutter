import 'package:calculator/view/calculator_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  CalculatorApp(),
           debugShowCheckedModeBanner: false,
    );
  }
}
