import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wibsite/sign_in/palet.dart';
// import 'package:log/palet.dart';

class textfeld extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool secrt;
  const textfeld(
      {super.key,
      required this.controller,
      required this.hint,
      required this.secrt});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 380),
      child: TextFormField(
        obscureText: this.secrt,
        controller: controller,
        decoration: InputDecoration(
            // icon: SvgPicture.asset(
            //   'assets/svgs/g_logo.svg',
            //   width: 20,
            //   color: Colors.white,
            // ),
            hintText: hint,
            contentPadding: const EdgeInsets.all(25),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xffFF0000), width: 4),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Pallete.borderColor, width: 4),
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
