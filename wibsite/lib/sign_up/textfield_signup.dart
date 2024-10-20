import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:wibsite/sign_in/palet.dart';

class textfiled_signup extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool secrt;
  final IconData icon;
  const textfiled_signup(
      {super.key,
      required this.icon,
      required this.controller,
      required this.hint,
      required this.secrt});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: TextFormField(
        obscureText: secrt,
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.blueGrey,
            ),
            // icon: SvgPicture.asset(
            //   'assets/svgs/g_logo.svg',
            //   width: 20,
            //   color: Colors.white,
            // ),
            hintText: hint,
            // labelStyle: TextStyle(color: Colors.white),
            hintStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 8, 84, 189)),
            contentPadding: const EdgeInsets.all(25),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 47, 5, 199), width: 4),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 55, 0, 237), width: 4),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
