import 'package:flutter/material.dart';
import 'package:myhealthdiary_app/pages/home_page.dart';
import 'package:myhealthdiary_app/widget/custom_textfield.dart';
import 'package:myhealthdiary_app/widget/password_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
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
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Because your health story matters!, signup to continue",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            CustomTextField(label: "Email", controller: emailController),
            SizedBox(height: 16),
            PasswordTextfield(controller: passwordController),
            SizedBox(height: 16),
            PasswordTextfield(controller: confirmPasswordController, label: "Confirm Password"),

            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}