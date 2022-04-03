import 'package:budget_recorder/widgets/card/category_card.dart';
import 'package:flutter/material.dart';

class AllAccounts extends StatefulWidget {
  const AllAccounts({Key? key}) : super(key: key);

  @override
  State<AllAccounts> createState() => _AllAccountsState();
}

class _AllAccountsState extends State<AllAccounts> {
  final List<String> allAccounts = <String>[
    'Acc1',
    'Acc2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Accounts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.more_vert,
                size: 30,
              ),
            ),
          ),
        ],
        actionsIconTheme: const IconThemeData(
          size: 30.0,
          color: Colors.white,
          opacity: 10.0,
        ),
      ),
      // body: SafeArea(
      //   child: ListView.builder(
      //     padding: const EdgeInsets.all(5),
      //     itemCount: allAccounts.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return CategoryCard(
      //         name: allAccounts[index],
      //         descriptions: "descriptions",
      //         type: "type",
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
