import 'package:budget_recorder/models/DailyTransaction.dart';
import 'package:budget_recorder/models/Transaction.dart';
import 'package:flutter/material.dart';

class MonthlyTransactionCard extends StatefulWidget {
  final String appCurrencyLabel;
  final List<DailyTransaction> transactionsList;
  const MonthlyTransactionCard({
    Key? key,
    required this.appCurrencyLabel,
    required this.transactionsList,
  }) : super(key: key);

  @override
  State<MonthlyTransactionCard> createState() => _MonthlyTransactionCardState();
}

class _MonthlyTransactionCardState extends State<MonthlyTransactionCard> {
  //calculate total of the month
  Object getTotalMonthly(List<Transaction> transList) {
    double tExpense = 0;
    double tIncome = 0;
    double amount = 0;
    double total = 0;

    //monthly transactions
    transList.forEach((item) {
      amount = item.amount;
      if (item.type == "Expense") {
        tExpense += amount;
      } else {
        tIncome += amount;
      }
    });

    total = tIncome - tExpense;
    return {total, tIncome, tExpense};
  }

  Widget getMainTransactionWidgets(List<DailyTransaction> transactionsList) {
    return Column(
      // children: dailyTransactionsList.map(
      //   (transaction) => Text("data"),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getMainTransactionWidgets(widget.transactionsList);
  }
}
