import 'package:budget_recorder/components/forms/category_form.dart';
import 'package:budget_recorder/widgets/text/appbar_title_text.dart';
import 'package:flutter/material.dart';

//
// Manage Categories CRUD -UIs
//

class MangeCategoryData extends StatefulWidget {
  final String formType = "Add";
  const MangeCategoryData({
    Key? key,
  }) : super(key: key);

  @override
  State<MangeCategoryData> createState() => _MangeCategoryDataState();
}

class _MangeCategoryDataState extends State<MangeCategoryData> {
  String? categoryType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: AppBarTitleText(title: "${widget.formType} Category"),
      ),
      body: SafeArea(
        child: CategoryForm(
          formType: widget.formType,
          categoryName: "",
          categoryType: "",
          categoryDescription: "",
        ),
      ),
    );
  }
}
