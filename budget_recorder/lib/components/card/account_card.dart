import 'package:flutter/material.dart';

//
// All view(List View) - Account Card
//

class AccountCard extends StatefulWidget {
  final String name, descriptions;
  final double balance;
  const AccountCard({
    Key? key,
    required this.name,
    required this.descriptions,
    required this.balance,
  }) : super(key: key);

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // widget.name,
                      "Account: ${widget.name}",
                      style: const TextStyle(
                        // color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      // widget.name,
                      "Balance: ${widget.balance}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.red[900],
                        // color: Colors.green[900],
                      ),
                    ),
                    Text(
                      // widget.name,
                      "Description: ${widget.descriptions}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Edit
                    IconButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, "/account/manage");
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Colors.amber[900],
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
