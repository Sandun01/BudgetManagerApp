import 'package:budget_recorder/models/Transaction.dart';
import 'package:flutter/material.dart';

//
// DailyTransactionCard
//

class DailyTransactionCard extends StatefulWidget {
  final String appCurrencyLabel;
  final List<Transaction> transactionList;
  const DailyTransactionCard({
    Key? key,
    required this.appCurrencyLabel,
    required this.transactionList,
  }) : super(key: key);

  @override
  State<DailyTransactionCard> createState() => _DailyTransactionCardState();
}

class _DailyTransactionCardState extends State<DailyTransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
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
                    children: const [
                      // date
                      Text(
                        "Day-15",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      // month & year
                      Text(
                        "03.2022",
                        style: TextStyle(
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
                        "${widget.appCurrencyLabel} 15000.00",
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
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // account
                  const Text(
                    "Salary",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  // category
                  const Text(
                    "Cash",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "15000.00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.red[900],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // account
                  const Text(
                    "Salary",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  // category
                  const Text(
                    "Cash",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "15000.00",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green[900],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
