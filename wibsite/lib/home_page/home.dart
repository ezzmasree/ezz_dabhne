// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'dart:io';

import 'package:flutter/material.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    return Scaffold(
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

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _selectedImage = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0C17),
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Color.fromARGB(255, 35, 33, 33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _pickImage, // Tapping the avatar allows image selection
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : AssetImage('assets/images/user_avatar.png')
                          as ImageProvider,
                  child: _selectedImage == null
                      ? Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 30,
                        )
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'John Doe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email: johndoe@example.com',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Add logout functionality or navigate to another page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffD5FF5F),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
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
