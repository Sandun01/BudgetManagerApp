// ignore_for_file: unnecessary_new

import 'package:budget_recorder/models/DailyTransaction.dart';
import 'package:budget_recorder/models/Transaction.dart';
import 'package:budget_recorder/screens/transactions/daily_transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//
// DailyTransactionCard
//

class DailyTransactionCard extends StatefulWidget {
  final String appCurrencyLabel;
  final List<DailyTransaction> transactionsList;
  const DailyTransactionCard({
    Key? key,
    required this.appCurrencyLabel,
    required this.transactionsList,
  }) : super(key: key);

  @override
  State<DailyTransactionCard> createState() => _DailyTransactionCardState();
}

class _DailyTransactionCardState extends State<DailyTransactionCard> {
  double getTotalTransactionAmount(List<Transaction> list) {
    double totalExpense = 0;
    double totalIncome = 0;
    double amount = 0;
    double total = 0;
    list.forEach((item) {
      // print(item);
      amount = item.amount;
      if (item.type == "Expense") {
        totalExpense += amount;
      } else {
        totalIncome += amount;
      }
    });
    total = totalIncome - totalExpense;
    return total;
  }

  Widget getTransactionWidgets(List<Transaction> transaction) {
    return new Column(
      children: transaction
          .map(
            (item) => new Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // account
                    Text(
                      item.getAccountName(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    // category
                    Text(
                      item.getCategoryName(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${widget.appCurrencyLabel} ${item.amount.toString()}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: item.type == "Expense"
                            ? Colors.red[900]
                            : Colors.green[900],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget getMainTransactionWidgets(
      List<DailyTransaction> dailyTransactionsList) {
    return new Column(
      children: dailyTransactionsList
          .map(
            (transaction) => new Card(
              elevation: 6,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            // date
                            Text(
                              "Day-${transaction.getTransactionDay().padLeft(2, "0")}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            // month & year
                            Text(
                              transaction
                                  .getTransactionMonthYear()
                                  .padLeft(2, "0"),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black45),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // date
                            const Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            // total
                            Text(
                              "${widget.appCurrencyLabel} ${getTotalTransactionAmount(transaction.transactions)}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black12,
                    ),
                    // transaction cards
                    getTransactionWidgets(transaction.transactions),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getMainTransactionWidgets(widget.transactionsList);
  }
}
