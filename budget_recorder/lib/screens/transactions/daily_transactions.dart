import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:intl/intl.dart';

class DailyTransactions extends StatefulWidget {
  const DailyTransactions({Key? key}) : super(key: key);

  @override
  State<DailyTransactions> createState() => _DailyTransactionsState();
}

class _DailyTransactionsState extends State<DailyTransactions> {
  DateTime? selectedDate;

  get _initialDate => DateTime.now();

  @override
  void initState() {
    super.initState();
    selectedDate = _initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      body: Column(
        children: [
          // Current date time header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: GestureDetector(
                  onTap: () {
                    showMonthPicker(
                      context: context,
                      initialDate: selectedDate ?? _initialDate,
                      locale: const Locale("en"),
                    ).then((date) {
                      if (date != null) {
                        setState(() {
                          selectedDate = date;
                        });
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Text(
                          // 'Year: ${selectedDate?.year} Month: ${DateFormat.MMMM().format(selectedDate!)}',
                          '${selectedDate?.year} - ${DateFormat.MMMM().format(selectedDate!)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.calendar_month,
                          size: 24.0,
                          semanticLabel: 'Select Date',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: //body scroll view
                SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Summery Section
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            const Text(
                              "Income",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "1000000.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.green[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            const Text(
                              "Expenses",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "1000000.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.red[900],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: const [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "1000000.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black12,
                  ),
                  // Daily Expense Cards
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Card(
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
                                  children: const [
                                    // date
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    // total
                                    Text(
                                      "Rs.15000.00",
                                      style: TextStyle(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
