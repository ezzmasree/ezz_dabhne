import 'package:flutter/material.dart';
import 'package:wibsite/sign_up/textfield_signup.dart';
import 'package:wibsite/sign_up_moblie/textfield_signup.dart';

class SignUpmoblie extends StatelessWidget {
  const SignUpmoblie({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController hintPasswordController =
        TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(color: Colors.black),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(left: 60, right: 60),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffD5FF5F),
                        ),
                      ),
                      SizedBox(height: 20),
                      textfiled_signupmoblie(
                        icon: Icons.email,
                        controller: emailController,
                        hint: "Email",
                        secrt: false,
                      ),
                      SizedBox(height: 10),
                      textfiled_signupmoblie(
                        icon: Icons.lock,
                        controller: passwordController,
                        hint: "Password",
                        secrt: true,
                      ),
                      SizedBox(height: 10),
                      textfiled_signupmoblie(
                        icon: Icons.lock_outline,
                        controller: hintPasswordController,
                        hint: "Confirm Password",
                        secrt: true,
                      ),
                      SizedBox(height: 10),
                      textfiled_signupmoblie(
                        icon: Icons.person,
                        controller: nameController,
                        hint: "Your Name",
                        secrt: false,
                      ),
                      SizedBox(height: 10),
                      textfiled_signupmoblie(
                        icon: Icons.cake,
                        controller: ageController,
                        hint: "Your Age",
                        secrt: false,
                      ),
                      SizedBox(height: 10),
                      textfiled_signupmoblie(
                        icon: Icons.height,
                        controller: ageController,
                        hint: "Your hight",
                        secrt: false,
                      ),
                      SizedBox(height: 10),
                      textfiled_signupmoblie(
                        icon: Icons.fitness_center,
                        controller: ageController,
                        hint: "Your weight",
                        secrt: false,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffD5FF5F),
                          fixedSize: const Size(300, 50),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Creat account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Already have an account? Sign In",
                          style: TextStyle(color: Color(0xffD5FF5F)),
                        ),
                      ),
                      Visibility(
                        visible: false,
                        child: Text(
                          "Please fill in all fields.",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
