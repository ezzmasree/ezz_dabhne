// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wibsite/sign_in/main.dart';
//import 'google_fonts';

class TheMainPage extends StatefulWidget {
  const TheMainPage({super.key});

  @override
  State<TheMainPage> createState() => _TheMainPageState();
}

class _TheMainPageState extends State<TheMainPage> {
  @override
  bool menu = true;
  bool fitnes = true;
  bool sport = true;

  double width = kIsWeb ? 290 : 40;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'welcome to our page ',
          style: GoogleFonts.oswald(
            textStyle: TextStyle(
              fontSize: 24, // Adjust font size as needed
              // fontWeight: FontWeight.bold, // Make it bold if desired
              color: Colors.white, // Set the text color
            ),
          ), //TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle Home menu tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle Settings menu tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                // Handle Logout menu tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        width: double
            .infinity, // This ensures the Container takes up the full width
        height: double.infinity,
        child: Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: width),
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        menu = false;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        menu = true;
                      });
                    },
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: Text(
                        "main",
                        style: GoogleFonts.merriweather(
                          textStyle: TextStyle(
                              color: menu ? Colors.black : Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        fitnes = false;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        fitnes = true;
                      });
                    },
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: Text(
                        "fitnes",
                        style: GoogleFonts.merriweather(
                          textStyle: TextStyle(
                              color: fitnes ? Colors.black : Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        sport = false;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        sport = true;
                      });
                    },
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: Text(
                        "sport",
                        style: GoogleFonts.merriweather(
                          textStyle: TextStyle(
                              color: sport ? Colors.black : Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/the_mainpage/a.png'),
                    fit: BoxFit.fill),
              ),
            )
          ],
        ),
      ),
    );
  }
}
