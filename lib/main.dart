import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wibsite/firebase_options.dart';

import 'package:wibsite/home_page/food_page/meals.dart';


import 'package:wibsite/sign_inmoblie/auth_gate.dart';




//import 'package:wibsite/db/mongo.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => MealProvider(),
      child: const MainApp(),
    ),
  );
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
  
}
