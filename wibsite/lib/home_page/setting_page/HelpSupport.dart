import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Help & Support',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.help, color: Color(0xffD5FF5F)),
              title: Text('FAQs', style: TextStyle(color: Color(0xffD5FF5F))),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xffD5FF5F)),
              onTap: () {
                // Navigate to FAQ page
              },
            ),
            Divider(color: Color(0xffD5FF5F)),
            ListTile(
              leading: Icon(Icons.contact_support, color: Color(0xffD5FF5F)),
              title: Text('Contact Support',
                  style: TextStyle(color: Color(0xffD5FF5F))),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xffD5FF5F)),
              onTap: () {
                // Navigate to contact support page
              },
            ),
            Divider(color: Color(0xffD5FF5F)),
            ListTile(
              leading: Icon(Icons.info, color: Color(0xffD5FF5F)),
              title:
                  Text('App Info', style: TextStyle(color: Color(0xffD5FF5F))),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xffD5FF5F)),
              onTap: () {
                // Navigate to app info page
              },
            ),
          ],
        ),
      ),
    );
  }
}
