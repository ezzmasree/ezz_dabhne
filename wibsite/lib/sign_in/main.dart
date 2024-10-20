// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:log/boton.dart';
// import 'package:log/palet.dart';
// import 'package:log/singboton.dart';
// import 'package:log/textfiled.dart';
import 'package:wibsite/sign_in/palet.dart';
import 'package:wibsite/sign_in/singboton.dart';
import 'package:wibsite/sign_in/textfiled.dart';
import 'package:http/http.dart' as http;
import 'package:wibsite/the_main_page/the_mainpage.dart';

class sign_in extends StatefulWidget {
  // Changed to StatefulWidget
  const sign_in({super.key});

  @override
  _SignInState createState() => _SignInState(); // Create the state class
}

class _SignInState extends State<sign_in> {
  TextEditingController emailcoun = TextEditingController();
  TextEditingController paswordcoun = TextEditingController();
  bool _isVisible = false; // Variable to control visibility of error message

  void searchById(String id) async {
    final url =
        Uri.parse('http://192.168.1.11:3000/pro/$id'); // Your Node.js API URL

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        if (data != null) {
          String password = data['password'];
          String email = data['email'];
          if (password == paswordcoun.text && email == emailcoun.text) {
            print("ezz is chelsea");
            setState(() {
              _isVisible = false; // Hide error message if password is correct
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        the_mainpage()), // Navigate to SecondPage
              );
            });
          } else {
            setState(() {
              paswordcoun.clear();
              _isVisible = true; // Show error message if password is incorrect
            });
          }
        }
        if (data == null) {
          setState(() {
            paswordcoun.clear();
            _isVisible = true; // Show error message if password is incorrect
          });
        }
      } else {
        print('Product not found!');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void sighpress() {
    String email = emailcoun.text;
    String password = paswordcoun.text;
    searchById(email);

    // For demonstration purposes, we'll print the values
    print('Email: $email');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Default back arrow icon
            onPressed: () {
              Navigator.pop(context); // Go back to the previous page
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/sign_in/ron.png'), // Change to your image path
              fit: BoxFit.fill, // Adjust to fit the screen
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = LinearGradient(
                          colors: const <Color>[
                            Color(0xFF693B37), // Your specified color
                            Colors.red, // Second color (change as needed)
                          ],
                        ).createShader(Rect.fromLTWH(
                            0, 0, 200, 70)), // Adjust width/height as needed
                    ),
                  ),
                  SizedBox(height: 70),
                  textfeld(
                    secrt: false,
                    controller: emailcoun,
                    hint: "Email", // Capitalized for consistency
                  ),
                  SizedBox(height: 20),
                  textfeld(
                    controller: paswordcoun,
                    hint: "Password",
                    secrt: true,
                  ),
                  Visibility(
                    visible:
                        _isVisible, // Control visibility based on _isVisible
                    child: Text(
                      "Wrong password or email",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  singboton(
                    onPressed: sighpress,
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
