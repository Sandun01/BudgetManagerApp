import 'package:budget_recorder/components/card/daily_transaction_card.dart';
import 'package:budget_recorder/data/currency_data.dart';
import 'package:budget_recorder/models/Transaction.dart';
import 'package:budget_recorder/providers/ThemeProvider.dart';
import 'package:budget_recorder/services/TransactionServices.dart';
import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

//
// Transactions daily
//
class DailyTransactions extends StatefulWidget {
  final TransactionService _transactionService;
  const DailyTransactions({
    Key? key,
    String? currData,
  })  : _transactionService = const TransactionService(),
        super(key: key);

  @override
  State<DailyTransactions> createState() => _DailyTransactionsState();
}

class _DailyTransactionsState extends State<DailyTransactions> {
  DateTime? selectedDate;
  bool dataLoading = true;
  List<Transaction> allMonthlyTransactions = <Transaction>[];

  get _initialDate => DateTime.now();

  void getMonthlyTransactions() async {
    await widget._transactionService
        .getAllMonthlyTransactions()
        .then(
          (value) => setState(
            () {
              dataLoading = false;
              allMonthlyTransactions = value!.cast<Transaction>();
            },
          ),
        )
        .onError(
          (error, stackTrace) => print(error),
        );
  }

  @override
  void initState() {
    super.initState();
    selectedDate = _initialDate;

    //get all transactions monthly
    getMonthlyTransactions();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<ThemeProvider>(context);
    String appCurrencyName = themeChange.appCurrency;
    String appCurrencyLabel = getLabelByName(appCurrencyName);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/transaction/manage");
        },
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
                      color: Theme.of(context).backgroundColor,
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
                              "$appCurrencyLabel 1000000.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
                              "$appCurrencyLabel 1000000.00",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red[900],
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
                              "Total",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "$appCurrencyLabel 1000000.00",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
                  DailyTransactionCard(
                    appCurrencyLabel: '',
                    transactionList: allMonthlyTransactions,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
