import 'package:budget_recorder/screens/accounts/all_accounts.dart';
import 'package:budget_recorder/screens/home.dart';
import 'package:budget_recorder/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BRIEFTASCHE",
      theme: ThemeData(
        //Default brightness and colors.
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(
            255, 0, 41, 73), //use -> Theme.of(context).primaryColor

        //Default font family.
        fontFamily: 'Sen',
      ),
      initialRoute: '/',
      routes: {
        // '/': (context) => Welcome(),
        '/': (context) => Home(),
        // '/home': (context) => Home(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
    );
  }
}
