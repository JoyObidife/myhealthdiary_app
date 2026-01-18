import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/widget/selection_grid_item.dart';
import 'package:myhealthdiary_app/widget/card_view.dart';
import 'package:myhealthdiary_app/widget/schedule_appointment_dialog.dart';
import 'package:myhealthdiary_app/widget/appointment_details_dialog.dart';
import 'package:myhealthdiary_app/widget/therapy_session_dialog.dart';

import 'package:myhealthdiary_app/widget/pain_crisis_log_dialog.dart';

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
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
             // SizedBox(height: 5),
              SelectionGridItem(),

              SizedBox(height: 18),
              Text(
                "Quick Actions",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  buildCardView(
                    icon: Icons.monitor_heart,
                    color: Colors.blue,
                    title: "Log Symptom",
                    onTap: () {
                      Navigator.pushNamed(context, '/log-symptom');
                    },
                  ),
                ],
              ),
              // Add Medication section
              SizedBox(height: 8),
              buildCardView(
                icon: Icons.add,
                title: "Add Medication",
                color: Colors.green,
                onTap: () {
                  Navigator.pushNamed(context, '/medications');
                },
              ),

              // Schedule Appointment Section
              SizedBox(height: 8),
              buildCardView(
                icon: Icons.event,
                title: "Schedule Appointment",
                color: Colors.blue,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>  ScheduleAppointmentDialog(),
                  );
                },
              ),

              // Crisis management section
              SizedBox(height: 8),
              buildCardView(
                icon: Icons.warning,
                title: "Crisis Management",
                color: Colors.red,
                onTap: () {
                  Navigator.pushNamed(context, '/crisis-management');
                },
              ),

               SizedBox(height: 16),
              Text(
                "Upcoming Events",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),

               // Crisis management section
              SizedBox(height: 8),
              buildCardView(
                icon: Icons.event,
                title: "Dr Chioma Appointment",
                 subtitle: "Today at 10:00 AM",
                color: Colors.blue,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>  AppointmentDetailsDialog(),
                  );
                },
              ),

               // Therapy section
              SizedBox(height: 8),
              buildCardView(
                icon: Icons.monitor_heart,
                title: "Therapy Session",
                 subtitle: "Friday, feb 2",
                color: Colors.blue,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>  TherapySessionDialog(),
                  );
                },
              ),

               //  Pain crisis section
              SizedBox(height: 8),
              buildCardView(
                icon: Icons.warning,
                title: "Pain Crisis",
                 subtitle: "Monday, Jan 28",
                color: Colors.red,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) =>  PainCrisisLogDialog(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}