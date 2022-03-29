import 'package:budget_recorder/screens/login.dart';
import 'package:budget_recorder/screens/profile.dart';
import 'package:budget_recorder/screens/register.dart';
import 'package:budget_recorder/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BRIEFTASCHE",
      home: Welcome(),
    );
  }
}
