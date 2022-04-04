import 'package:flutter/material.dart';

//
// summary transactions
//

class TotalTransactions extends StatefulWidget {
  const TotalTransactions({ Key? key }) : super(key: key);

  @override
  State<TotalTransactions> createState() => _TotalTransactionsState();
}

class _TotalTransactionsState extends State<TotalTransactions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('total_transactions'),
    );
  }
}