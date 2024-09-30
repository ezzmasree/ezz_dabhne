// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class apar extends StatelessWidget {
  const apar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 110,
            width: 100,
            child: Image.asset('assets/logo.png'),
          ),
          Row(
            children: [
              Text(
                "expoide",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                "about",
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}
