import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String name = "";
  String email = "";
  String password = "";
  int age = 1;
  int weaight = 1;

  @override
  void initState() {
    super.initState();
    searchById("ezz2002gmail.com"); // Automatically call searchById
  }

  void searchById(String id) async {
    final url = Uri.parse('http://192.168.1.4:3000/pro/$id');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        setState(() {
          name = data['name'] ?? 'No name'; // Extract 'name' from the response
          email = data['email'] ?? 'No email';
          password = data['password'] ?? 'No password';
          age = data['age'] ?? 0;
          weaight = data['weight'] ?? 0;
        });
      } else {
        print('Product not found!');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0C17),
      // appBar: AppBar(
      //   title: Text('Account'),
      //   // backgroundColor: Color.fromARGB(255, 35, 33, 33),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Center horizontally
            children: [
              GestureDetector(
                onTap: () {
                  searchById("ezz2002gmail.com");
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  backgroundImage: AssetImage("assets/avatar.jpg"),
                  // child: Icon(
                  //   Icons.person,
                  //   color: Colors.white,
                  //   size: 30,
                  // ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                // mainAxisAlignment:
                //     MainAxisAlignment.center, // Center Row contents
                children: [
                  Icon(Icons.person, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'name: $name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                // mainAxisAlignment:
                //     MainAxisAlignment.center, // Center Row contents
                children: [
                  Icon(Icons.email, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    'Email: $email',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                // mainAxisAlignment:
                //     MainAxisAlignment.center, // Center Row contents
                children: [
                  Icon(Icons.lock, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    'password: $password',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                // mainAxisAlignment:
                //     MainAxisAlignment.center, // Center Row contents
                children: [
                  Icon(Icons.cake, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    'age: $age',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                // mainAxisAlignment:
                //     MainAxisAlignment.center, // Center Row contents
                children: [
                  Icon(Icons.monitor_weight, color: Colors.grey),
                  SizedBox(width: 10),
                  Text(
                    'weight: $weaight', // Fix typo from 'weaight' to 'weight'
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                    ),
                  ),
                ],
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
