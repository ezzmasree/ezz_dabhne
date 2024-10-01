// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wibsite/sign_up/textfield_signup.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController hintpasswordcontroller = TextEditingController();
    TextEditingController namecontroller = TextEditingController();
    TextEditingController agecontroller = TextEditingController();

    void onPressed() {}

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make the AppBar transparent
        elevation: 0, // Remove the AppBar shadow
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: Colors.black), // Back arrow button
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/sign_up/blue.png'),
              fit: BoxFit
                  .fill, // Use cover for full coverage while maintaining aspect ratio
            ),
          ),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color to white
                borderRadius:
                    BorderRadius.circular(15), // Optional: add rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 8, 84, 189)),
                    ),
                    SizedBox(height: 20),
                    textfiled_signup(
                        icon: Icons.email,
                        controller: emailcontroller,
                        hint: "Email",
                        secrt: false),
                    SizedBox(height: 10),
                    textfiled_signup(
                        icon: Icons.lock,
                        controller: passwordcontroller,
                        hint: "Password",
                        secrt: true),
                    SizedBox(height: 10),
                    textfiled_signup(
                        icon: Icons.lock_outline,
                        controller: hintpasswordcontroller,
                        hint: "Confirm Password",
                        secrt: true),
                    SizedBox(height: 10),
                    textfiled_signup(
                        icon: Icons.person,
                        controller: namecontroller,
                        hint: "Your Name",
                        secrt: false),
                    SizedBox(height: 10),
                    textfiled_signup(
                        icon: Icons.cake,
                        controller: agecontroller,
                        hint: "Your Age",
                        secrt: false),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 255, 255, 255),
                            Color.fromARGB(255, 5, 176, 238),
                            Color.fromARGB(255, 20, 0, 122),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors
                              .transparent, // Transparent background for gradient effect
                          fixedSize: const Size(300, 50),
                        ),
                        onPressed: onPressed, // Using the onPressed callback
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Already have an account? Sign In",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
