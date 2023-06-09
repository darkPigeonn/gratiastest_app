import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gratiastest_app/admin/screens/questions.dart';

import 'admin/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyD-5fBnuPr_K7oEDOrMd80_WSmNbhRrbB8",
    projectId: "gratias-test",
    messagingSenderId: "868290605639",
    appId: "1:868290605639:web:28b1b3b9c7c0160915f762",
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: QuestionAdd(),
    );
  }
}
