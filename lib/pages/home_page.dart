import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/widget/selection_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                //height: 100,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.blue)],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Joy!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Thursday, December 20, 2025",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Today's Overview",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 16),
              SelectionGridItem(),

              SizedBox(height: 18),
              Text(
                "Quick Actions",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  _buildCardView(
                    icon: Icons.monitor_heart,
                    color: Colors.blue,
                    title: "Log Symptom",
                    onTap: () {},
                  ),
                ],
              ),
              // Add Medication section
              SizedBox(height: 8),
              _buildCardView(
                icon: Icons.add,
                title: "Add Medication",
                color: Colors.green,
                onTap: () {},
              ),

              // Schedule Appointment Section
              SizedBox(height: 8),
              _buildCardView(
                icon: Icons.event,
                title: "Schedule Appointment",
                color: Colors.blue,
                onTap: () {},
              ),

              // Crisis management section
              SizedBox(height: 8),
              _buildCardView(
                icon: Icons.warning,
                title: "Crisis Management",
                color: Colors.red,
                onTap: () {},
              ),

               SizedBox(height: 16),
              Text(
                "Upcomping Events",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

               // Crisis management section
              SizedBox(height: 8),
              _buildCardView(
                icon: Icons.event,
                title: "Dr Chioma Appointment",
                 subtitle: "Today at 10:00 AM",
                color: Colors.blue,
                onTap: () {},
              ),

               // Therapy section
              SizedBox(height: 8),
              _buildCardView(
                icon: Icons.monitor_heart,
                title: "Therapy Session",
                 subtitle: "Friday, feb 2",
                color: Colors.blue,
                onTap: () {},
              ),

               //  Pain crisis section
              SizedBox(height: 8),
              _buildCardView(
                icon: Icons.warning,
                title: "Pain Crisis",
                 subtitle: "Monday, Jan 28",
                color: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCardView({
  required IconData icon,
  required String title,
  String? subtitle,
  required VoidCallback onTap,
  required Color color, // icon color
}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade200,
              child: Icon(icon, color: color, size: 28),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
}