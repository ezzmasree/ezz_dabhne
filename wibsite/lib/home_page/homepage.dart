// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wibsite/home_page/text.dart';

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 1000),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    scale: 1,
                    image: AssetImage("assets/pic.jpeg"),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), // Adjust opacity here
                        BlendMode.darken))),
            padding: EdgeInsets.all(50),
            alignment: Alignment.topLeft,
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 800),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // apar(),
                      Padding(
                        padding: EdgeInsets.only(top: 55),
                        child: para(),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}
