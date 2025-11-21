import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyHealthDiary',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        primaryColor: Colors.lightBlue.shade400,
      ),
      
      debugShowCheckedModeBanner: false,
      home: const OnboardingPage(),
    );
  }
}

