import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wibsite/firebase_options.dart';
import 'package:wibsite/home_page/ai_chat/interface.dart';

import 'package:wibsite/home_page/home.dart';
import 'package:wibsite/sign_inmoblie/auth_gate.dart';

import 'package:wibsite/sign_inmoblie/signin_moblie.dart';

import 'package:wibsite/sign_up_moblie/sign_upmoblie.dart';
//import 'package:wibsite/db/mongo.dart';

import 'home_page/myHome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ezz masre",
      debugShowCheckedModeBanner: false,
      // home: Home_Page(),
      home: auth_gate(),
      //home: signin_mobilState(),
      //home: ChatBotPage(),
    );
  }
  /*
  final List<Map<String, String>> videos = [
    {
      'id': 'o2tDhbgYEdk',
      'title': 'Workout Video 10',
      'description': 'This is a description for video 1.'
    },
    {
      'id': '1Lg5rJSKjZk',
      'title': 'Workout Video 2',
      'description': 'This is a description for video 2.'
    },
    {
      'id': 'LFJ9ptKsQUo',
      'title': 'Workout Video 3',
      'description': 'This is a description for video 3.'
    },
    {
      'id': 'qdGtc6-c0F0',
      'title': 'Workout Video 4',
      'description': 'This is a description for video 4.'
    },
  ];
  */
}
