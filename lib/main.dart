import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gooo/firebase_options.dart';
import 'package:gooo/login.dart';
import 'package:gooo/phone.dart';
import 'package:gooo/signin%20with%20google.dart';
import 'package:gooo/signin.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LoginScreen(),
    );
  }
}

