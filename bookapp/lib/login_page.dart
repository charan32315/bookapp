import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding/decoding
import 'signup_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login
  Future<void> _login() async {
    final url = Uri.parse('http://localhost:3000/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'email': _emailController.text,
      'password': _passwordController.text,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Display error message from backend
        _showErrorDialog(data['error'] ?? 'Login failed. Please try again.');
      }
    } catch (e) {
      _showErrorDialog('An error occurred. Please try again later.');
    }
  }

  // Show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Background image
            fit: BoxFit.cover,
            alignment: Alignment.center, // Center the image
            scale: 1.5,  // Zoom in on the background image
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: 400,  // Increased width
              padding: EdgeInsets.all(30), // Increased padding
              decoration: BoxDecoration(
                color: Colors.blue[800]?.withOpacity(0.9) ?? Colors.blue[700]!.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16), // Increased border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    spreadRadius: 3,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 150,  // Increased image size
                    height: 150, // Increased image size
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(fontSize: 18),  // Increased label text size
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(fontSize: 18),  // Increased text field font size
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 18),  // Increased label text size
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(fontSize: 18),  // Increased text field font size
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _login, // Call the login function
                    child: Text(
                      "Log In",
                      style: TextStyle(fontSize: 18),  // Increased button text size
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),  // Increased padding
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16),  // Increased text size
                    ),
                    child: Text("Don't have an account? Sign up"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
