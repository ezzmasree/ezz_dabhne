import 'package:flutter/material.dart';
//import 'package:wibsite/db/mongo.dart';
import 'package:wibsite/home_page/homepage.dart';

import 'the_main_page/the_mainpage.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await mongo.connect();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ezz masre",
      debugShowCheckedModeBanner: false,
      // home: homepage(),
      home: TheMainPage(),
    );
  }
}
