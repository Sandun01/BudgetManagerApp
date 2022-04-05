import 'dart:convert';
import 'package:budget_recorder/models/Category.dart';
import 'package:budget_recorder/models/Transaction.dart';
import 'package:http/http.dart';

class TransactionService {
  static const String endpoint = "http://10.0.2.2:5000/api/transactions/";

  const TransactionService();

  Future<List?> getAllMonthlyTransactions() async {
    //get all transactions
    try {
      List<Transaction> transactionsList = [];
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var data = jsonDecode(jsonData);

        if (data["success"]) {
          var dataArr = data["transactions"];
          dataArr.forEach((item) {
            transactionsList.add(Transaction.fromMap(item));
          });
          print(transactionsList);
          return transactionsList;
        } else {
          return Future.error('Error!');
        }
      } else {
        return Future.error('Error!');
      }
    } catch (e) {
      print(e);
      return Future.error('Error!');
    }
  }
}
