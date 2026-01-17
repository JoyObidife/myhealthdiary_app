import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/navigationbar/bottom_nativagation_page.dart';
import 'package:myhealthdiary_app/pages/onboarding_page.dart';
import 'package:myhealthdiary_app/pages/log_symptom_page.dart';
import 'package:myhealthdiary_app/pages/medications_page.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const BottomNavigation(),
        '/log-symptom': (context) => const LogSymptomPage(),
        '/medications': (context) => const MedicationsPage(),
      },
      // home: BottomNavigation(), // Removed in favor of routes
    );
  }
}

