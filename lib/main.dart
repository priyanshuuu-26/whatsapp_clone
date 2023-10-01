import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/color.dart';
import 'package:whatsapp_clone/firebase_options.dart';
import 'package:whatsapp_clone/pages/mobile_screen.dart';
import 'package:whatsapp_clone/pages/web_screen.dart';
import 'package:whatsapp_clone/reponsive/layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: const ResponsiveLayout(
          mobileScreen: mobileScreen(), webScreen: webScreen()),
    );
  }
}
