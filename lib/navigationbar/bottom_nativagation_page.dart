import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/pages/home_page.dart';
import 'package:myhealthdiary_app/pages/medications_page.dart';
import 'package:myhealthdiary_app/pages/profile_page.dart';
import 'package:myhealthdiary_app/pages/symptoms_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexToBeShown = 0;

  var pages = [HomePage(), SymptomsPage(), MedicationsPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],

      bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.blue.shade50,
        currentIndex: indexToBeShown,
        selectedItemColor: Colors.blue,   
      unselectedItemColor: Colors.grey,   
        onTap: (value) {
          setState(() {
            indexToBeShown = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade100,
            label: "Home",
            icon: Icon(Icons.home, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            label: "Symptoms",
            icon: Icon(Icons.monitor_heart, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            label: "Medications",
            icon: Icon(Icons.medication, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
