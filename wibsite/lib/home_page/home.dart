// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wibsite/home_page/account_page/account.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget _createDrawerItem(
        {required IconData icon,
        required String text,
        required VoidCallback onTap,
        Color? color}) {
      return ListTile(
        leading: Icon(icon, color: color ?? Color(0xffD5FF5F)),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        onTap: onTap,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0A0C17),
        title: Text('Home Page', style: TextStyle(color: Color(0xffD5FF5F))),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: Color(0xffD5FF5F),
            ), // Custom menu icon
            onPressed: () {
              Scaffold.of(context)
                  .openDrawer(); // Open the drawer using the right context
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xff1F1F28), // Darker background for the drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff25252D), // Slightly lighter header background
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                  )
                ],
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Dabhne Fitness',
                  style: TextStyle(
                    color: Color(0xffD5FF5F),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            _createDrawerItem(
              icon: Icons.home_outlined,
              text: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _createDrawerItem(
              icon: Icons.account_circle_outlined,
              text: 'Account',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _createDrawerItem(
              icon: Icons.settings_outlined,
              text: 'Settings',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),
            _createDrawerItem(
              icon: Icons.description_outlined,
              text: 'Terms and Conditions',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _createDrawerItem(
              icon: Icons.feedback_outlined,
              text: 'Give Us Feedback',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _createDrawerItem(
              icon: Icons.support_agent_outlined,
              text: 'Support',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(color: Colors.grey.shade600, thickness: 1),
            _createDrawerItem(
              icon: Icons.logout,
              text: 'Log Out',
              color: Colors
                  .redAccent, // Red color for log out to make it stand out
              onTap: () {
                // Log out action here
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff0A0C17),
      body: _getBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(
            12.0), // Add some space around the BottomNavigationBar
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(30.0), // Makes the corners circular
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index; // Update the selected index
              });
            },
            selectedItemColor: Color(0xffD5FF5F),
            unselectedItemColor: Colors.grey,
            backgroundColor:
                Color.fromARGB(255, 35, 33, 33), // Custom background color
            elevation: 0, // Removes the shadow/elevation
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu),
                label: 'Meal',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.miscellaneous_services),
                label: 'Service',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to return the current page widget
  Widget _getBody() {
    if (_currentIndex == 0) {
      return HomePage();
    } else if (_currentIndex == 1) {
      return AccountPage();
    } else if (_currentIndex == 2) {
      return MealPage();
    } else if (_currentIndex == 3) {
      return ServicePage();
    } else {
      return Center(child: Text('Select a page'));
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome to the Home Page!'),
    );
  }
}

class MealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome to the Meal Page!'),
    );
  }
}

class ServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome to the Service Page!'),
    );
  }
}
