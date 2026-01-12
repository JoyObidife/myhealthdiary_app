import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/widget/card_view.dart';
import 'package:myhealthdiary_app/widget/symptom_card.dart';

class SymptomsPage extends StatefulWidget {
  const SymptomsPage({super.key});

  @override
  State<SymptomsPage> createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  final List<Map<String, String>> symptoms = [
    {
      'title': 'Fatigue',
      'date': 'Nov 8, 2025',
      'severity': 'Moderate',
      'pain': 'Pain: 5/10',
      'color': 'blue',
    },
    {
      'title': 'Joint Pain',
      'date': 'Nov 11, 2025',
      'severity': 'Severe',
      'pain': 'Pain: 7/10',
      'color': 'red',
    },
    {
      'title': 'Headache',
      'date': 'Nov 12, 2025',
      'severity': 'Mild',
      'pain': 'Pain: 3/10',
      'color': 'green',
    },
    {
      'title': 'Chest Pain',
      'date': 'Nov 15, 2025',
      'severity': 'Moderate',
      'pain': 'Pain: 6/10',
      'color': 'blue',
    },
  ];

  Color _getSeverityColor(String color) {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

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
                      'Symptoms Log',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Track your daily symptoms",
                      style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Log New Symptom",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Recent Entries",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  for (var symptom in symptoms)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: buildSymptomCard(
                        title: symptom['title']!,
                        date: symptom['date']!,
                        severity: symptom['severity']!,
                        painLevel: symptom['pain']!,
                        severityColor: _getSeverityColor(symptom['color']!),
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
