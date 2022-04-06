import 'package:budget_recorder/models/Category.dart';
import 'package:budget_recorder/services/CategoryService.dart';
import 'package:budget_recorder/widgets/dialogbox/custom_dialogbox.dart';
import 'package:budget_recorder/widgets/loaders/operationLoaderIndicator.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';
//
// Manage Categories - ADD/EDIT Forms
//

class CategoryForm extends StatefulWidget {
  final String formType, categoryName, categoryType, categoryDescription;
  final CategoryService _categoryService;

  const CategoryForm({
    Key? key,
    required this.formType,
    required this.categoryName,
    required this.categoryType,
    required this.categoryDescription,
  })  : _categoryService = const CategoryService(),
        super(key: key);

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _selectedValueKey = GlobalKey<FormState>();
  String? selectedValue;

  Category _category = Category("", "", "", "");

  // var createCategoryData = {
  //   "name": "",
  //   "category": "",
  //   "type": "",
  // };

  //Create new category
  void createNewCategory() async {
    //save form fields
    _formKey.currentState!.save();
    // print(_category.name);

    await widget._categoryService.createCategory(_category).then(
      (value) {
        print(value);
        if (value!) {
          //if success
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomDialogBox(
                title: "Success!",
                descriptions: "Category Created Successfully!",
                text: "OK",
                route: "/home",
                arguments: {
                  "tabIndex": 1, //category tab
                },
                btnColor: "", //Error
              );
            },
          );
          //reset form
          _formKey.currentState!.reset();
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomDialogBox(
                title: "Error!",
                descriptions: "Please Try Again Later.",
                text: "OK",
                route: "",
                arguments: "",
                btnColor: "Error", //Error
              );
            },
          );
        }
      },
    ).onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        // color: Colors.amber,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    maxLength: 15,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Category Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter category name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _category.setName(value!);
                      // createCategoryData = {
                      //   "name": value.toString(),
                      //   "category": createCategoryData['category'].toString(),
                      //   "type": createCategoryData['type'].toString(),
                      // };
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // ===============================================================
                  DropdownButtonFormField(
                    key: _selectedValueKey,
                    hint: const Text("Category Type"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) =>
                        value == null ? "Select a Category Type" : null,
                    // dropdownColor: Colors.blueAccent,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: <String>['Income', 'Expense']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onSaved: (value) {
                      _category.setType(selectedValue!);
                      // createCategoryData = {
                      //   "name": createCategoryData['name'].toString(),
                      //   "category": selectedValue.toString(),
                      //   "type": createCategoryData['type'].toString(),
                      // };
                    },
                  ),

                  // ===============================================================
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    minLines: 1,
                    maxLines: 3,
                    maxLength: 40,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Description',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter category description';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _category.setDescription(value!);
                      // createCategoryData = {
                      //   "name": createCategoryData['name'].toString(),
                      //   "category": selectedValue.toString(),
                      //   "type": value.toString(),
                      // };
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        createNewCategory();
                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return const OperationLoader();
                        //   },
                        // );
                        // If the form is valid, display a snackbar. In the real world,
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(content: Text('Processing Data...')),
                        // );
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber[800]),
                      elevation: MaterialStateProperty.all(5),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.save,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Save',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
