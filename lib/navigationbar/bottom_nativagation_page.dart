
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
  int indexToBeShown = 1;

  var pages = [HomePage(), SymptomsPage(), MedicationsPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexToBeShown],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexToBeShown,
        onTap: (value) {
          setState(() {
            indexToBeShown = value;
        
            
          });
 },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Symptoms", icon: Icon(Icons.warning)), 
          BottomNavigationBarItem(label: "Medications", icon: Icon(Icons.medication)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
      ),
    );
  }
}