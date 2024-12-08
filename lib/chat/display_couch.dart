import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wibsite/chat/chatpage.dart';
import 'package:wibsite/chat/chatservice.dart';
import 'package:wibsite/chat/usertile.dart';
import 'package:wibsite/sign_inmoblie/auth.dart';

class DisplayCouch extends StatelessWidget {
  DisplayCouch({super.key});
  final Authservce auth = Authservce();
  final chatservice chat = chatservice();
  User? getcurrent() {
    return auth.getcurrentuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: chat.getuserstream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("An error occurred!"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No users found."));
        }

        // Build a ListView of users
        return ListView(
          children: snapshot.data!
              .map((userData) => _buildUserTile(userData, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildUserTile(Map<String, dynamic> userData, BuildContext context) {
    if (userData["email"] != auth.getcurrentuser()!.email) {
      return Usertile(
        text: userData["email"] ?? "No Email", // Show "No Email" if missing
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chatpage(
                riciveemail: userData["email"],
                riciveid: userData["uid"],
              ),
            ),
          );
        },
      );
    } else
      return Container();
  }
}
