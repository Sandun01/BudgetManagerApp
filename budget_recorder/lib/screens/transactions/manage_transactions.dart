import 'package:budget_recorder/components/forms/transaction_form.dart';
import 'package:budget_recorder/widgets/text/appbar_title_text.dart';
import 'package:flutter/material.dart';

//
// Manage all CRUD UIS - transactions
//

class ManageTransactions extends StatefulWidget {
  const ManageTransactions({Key? key}) : super(key: key);
  final String formType = "Add";

  @override
  State<ManageTransactions> createState() => _ManageTransactionsState();
}

class _ManageTransactionsState extends State<ManageTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: AppBarTitleText(title: "${widget.formType} Transaction"),
      ),
      body: SafeArea(
        child: TransactionForm(
          formType: widget.formType,
          transactionDate: "",
          transactionAccount: "",
          transactionType: "",
          transactionCategory: "",
          transactionDescription: "",
        ),
      ),
    );
  }
}
