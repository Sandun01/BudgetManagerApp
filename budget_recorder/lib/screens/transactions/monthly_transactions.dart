import 'package:flutter/material.dart';

//
// Transactions monthly
//

class MonthlyTransactions extends StatefulWidget {
  const MonthlyTransactions({ Key? key }) : super(key: key);

  @override
  State<MonthlyTransactions> createState() => _MonthlyTransactionsState();
}

class _MonthlyTransactionsState extends State<MonthlyTransactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('monthly_transactions'),
    );
  }
}