import 'package:flutter/material.dart';
import 'package:wibsite/home_page/home.dart';
import 'package:provider/provider.dart';
import 'package:wibsite/home_page/imageprovider.dart';
//import 'package:wibsite/db/mongo.dart';

import 'package:wibsite/sign_inmoblie/sighnImoblie.dart';
import 'package:wibsite/sign_up_moblie/sign_upmoblie.dart';
import 'package:wibsite/the_main_page/the_mainpage.dart';
import 'package:wibsite/welcome_page/welcome.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await mongo.connect();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ezz masre",
      debugShowCheckedModeBanner: false,
      //home: Home_Page(),
      //home: TheMainPage(),
      home: SignUpmoblie(),
    );
  }
}
