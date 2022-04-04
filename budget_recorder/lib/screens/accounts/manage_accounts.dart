import 'package:budget_recorder/components/forms/account_form.dart';
import 'package:budget_recorder/widgets/text/appbar_title_text.dart';
import 'package:flutter/material.dart';

//
// Manage Account CRUD -UIs
//

class ManageAccounts extends StatefulWidget {
  const ManageAccounts({Key? key}) : super(key: key);
  final String formType = "Add";

  @override
  State<ManageAccounts> createState() => _ManageAccountsState();
}

class _ManageAccountsState extends State<ManageAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: AppBarTitleText(title: "${widget.formType} Account"),
      ),
      body: SafeArea(
        child: AccountForm(
          formType: widget.formType,
          accountDescription: "a",
          accountName: "a",
          accountBalance: 100,
        ),
      ),
    );
  }
}
