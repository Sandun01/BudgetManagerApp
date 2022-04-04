import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

//
// Manage Transactions - ADD/EDIT Forms
//

class TransactionForm extends StatefulWidget {
  final String formType,
      transactionDate,
      transactionAccount,
      transactionType,
      transactionCategory,
      transactionDescription;

  const TransactionForm({
    Key? key,
    required this.formType,
    required this.transactionDate,
    required this.transactionAccount,
    required this.transactionType,
    required this.transactionCategory,
    required this.transactionDescription,
  }) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedAccount, _selectedType;
  String _initialDateVal = DateTime.now().toString();

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

                  Stack(
                    children: <Widget>[
                      DateTimePicker(
                        type: DateTimePickerType.dateTimeSeparate,
                        initialValue: _initialDateVal,
                        firstDate: DateTime(DateTime.now().year - 20),
                        lastDate: DateTime(DateTime.now().year + 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Date & Time',
                        ),
                        onChanged: (value) => print(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Transaction Date and Time';
                          }
                          return null;
                        },
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // ===============================================================
                  DropdownButtonFormField(
                    hint: const Text("Account"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) =>
                        value == null ? "Select a Account" : null,
                    // dropdownColor: Colors.blueAccent,
                    value: _selectedAccount,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedAccount = newValue!;
                      });
                    },
                    items: <String>['Acc1', 'Acc2']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // ===============================================================
                  DropdownButtonFormField(
                    hint: const Text("Type"),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) =>
                        value == null ? "Select a Transaction Type" : null,
                    // dropdownColor: Colors.blueAccent,
                    value: _selectedType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedType = newValue!;
                      });
                    },
                    items: <String>['Income', 'Expense']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // ===============================================================
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Amount',
                    ),
                    validator: (value) {
                      try {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Transaction Amount';
                        } else if (double.parse(value) <= 0) {
                          return 'Please enter amount grater than 0';
                        } else if (!RegExp(r'^\d+\.?\d{0,2}$')
                            .hasMatch(value)) {
                          return 'Please enter amount to two decimal points';
                        }
                      } on Exception catch (_) {
                        //non numeric values E.g: 0.0.0
                        return 'Please enter valid Transaction Amount';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // ===============================================================
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // -------------------------------------------------------------------------
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data...')),
                        );
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
