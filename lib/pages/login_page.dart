import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/widget/custom_textfield.dart';
import 'package:myhealthdiary_app/widget/password_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(height: 40),
            Icon(Icons.health_and_safety, color: Colors.blue, size: 80),

            SizedBox(height: 10),
            Text("MyHealthDiary", style: TextStyle(fontSize: 20)),

            SizedBox(height: 10),
            Text(
              "Welcome back! Please login to continue",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  CustomTextField(label: "Email",),
                  PasswordTextfield()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


