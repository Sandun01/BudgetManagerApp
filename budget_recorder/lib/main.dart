import 'package:budget_recorder/screens/accounts/account_summary.dart';
import 'package:budget_recorder/screens/accounts/manage_accounts.dart';
import 'package:budget_recorder/screens/app_settings/feedback.dart';
import 'package:budget_recorder/screens/app_settings/help.dart';
import 'package:budget_recorder/screens/categories/manage_category.dart';
import 'package:budget_recorder/screens/home.dart';
import 'package:budget_recorder/screens/transactions/manage_transactions.dart';
import 'package:flutter/material.dart';
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
        '/account/manage': (context) => ManageAccounts(),
        '/account/summary': (context) => AccountSummary(),
        '/category/manage': (context) => MangeCategoryData(),
        '/transaction/manage': (context) => ManageTransactions(),
        '/help': (context) => Help(),
        '/feedback': (context) => AppFeedback(),
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
