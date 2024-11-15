import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON encoding
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();

  Future<void> _signup() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String rePassword = _rePasswordController.text.trim();

    if (password != rePassword) {
      _showMessage("Passwords do not match!", Colors.red);
      return;
    }

    final url = Uri.parse('http://localhost:3000/auth/signup');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        _showMessage("Signup successful! Please log in.", Colors.green);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        final errorResponse = jsonDecode(response.body);
        _showMessage(errorResponse['message'] ?? 'Signup failed.', Colors.red);
      }
    } catch (e) {
      _showMessage("Error: ${e.toString()}", Colors.red);
    }
  }

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
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
                    'assets/signup_logo.png',
                    width: 150,  // Increased image size
                    height: 150, // Increased image size
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(fontSize: 18),  // Increased label text size
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    style: TextStyle(fontSize: 18),  // Increased text field font size
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  TextField(
                    controller: _rePasswordController,
                    decoration: InputDecoration(
                      labelText: "Re-enter Password",
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
                    onPressed: _signup,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18),  // Increased button text size
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),  // Increased padding
                    ),
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(fontSize: 16),  // Increased text size
                    ),
                    child: Text("Already have an account? Log in"),
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
