import 'package:budget_recorder/screens/transactions/daily_transactions.dart';
import 'package:budget_recorder/screens/transactions/monthly_transactions.dart';
import 'package:budget_recorder/screens/transactions/total_transactions.dart';
import 'package:budget_recorder/widgets/text/appbar_title_text.dart';
import 'package:flutter/material.dart';

//
// Manage all transactions tabs
//

class TransactionTabsManager extends StatefulWidget {
  const TransactionTabsManager({Key? key}) : super(key: key);

  @override
  State<TransactionTabsManager> createState() => _TransactionTabsManagerState();
}

class _TransactionTabsManagerState extends State<TransactionTabsManager> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            indicatorWeight: 5,
            unselectedLabelColor: Color.fromARGB(119, 255, 255, 255),
            tabs: [
              Tab(
                child: Text(
                  'Daily',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Monthly',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          title: const AppBarTitleText(title: 'Transactions'),
        ),
        body: const TabBarView(
          children: [
            DailyTransactions(),
            MonthlyTransactions(),
            TotalTransactions(),
          ],
        ),
      ),
    );
  }
}
