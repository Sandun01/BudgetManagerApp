import 'package:flutter/material.dart';
import 'package:budget_recorder/components/card/account_card.dart';
import 'package:budget_recorder/widgets/text/appbar_title_text.dart';

//
// All Accounts
//
class AllAccounts extends StatefulWidget {
  const AllAccounts({Key? key}) : super(key: key);

  @override
  State<AllAccounts> createState() => _AllAccountsState();
}

class _AllAccountsState extends State<AllAccounts> {
  final List<String> allAccounts = <String>[
    'Cash',
    'Card',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const AppBarTitleText(title: 'Accounts'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Add"),
                value: 1,
              ),
              const PopupMenuItem(
                child: Text("Summary"),
                value: 2,
              )
            ],
            onSelected: (int menu) {
              if (menu == 1) {
                Navigator.pushNamed(context, "/account/manage");
              }
              else if (menu == 2) {
                Navigator.pushNamed(context, "/account/summary");
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header Summery Section
            const SizedBox(
              height: 10,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: const [
                        Text(
                          "Assets",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "1500000.00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            // color: Colors.green[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // divider
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.grey[500],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: const [
                        Text(
                          "Liabilities",
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
                            // color: Colors.red[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // divider
                  VerticalDivider(
                    thickness: 2,
                    color: Colors.grey[500],
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
                          "500000.00",
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
            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
            // List view
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: allAccounts.length,
                itemBuilder: (BuildContext context, int index) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: AccountCard(
                        name: allAccounts[index],
                        descriptions: "acc description",
                        balance: 1200,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
