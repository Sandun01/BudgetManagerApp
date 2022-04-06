import 'dart:convert';
import 'package:budget_recorder/models/Account.dart';
import 'package:budget_recorder/models/Category.dart';
import 'package:budget_recorder/models/DailyTransaction.dart';
import 'package:budget_recorder/models/Date.dart';
import 'package:budget_recorder/models/Transaction.dart';
import 'package:http/http.dart';

class TransactionService {
  static const String endpoint = "http://10.0.2.2:5000/api/transactions";

  const TransactionService();

  //get all monthly transactions
  //Month and Year format -> "02-2022"
  Future<List?> getAllDailyTransactions(String monthYear) async {
    try {
      List<DailyTransaction> listDailyTransactions = [];
      Response response = await get(Uri.parse("$endpoint/day/$monthYear"));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var data = jsonDecode(jsonData);

        if (data["success"]) {
          var dataArr = data["transactions"];
          dataArr.forEach((item) {
            List<Transaction> listTransactions = [];
            var transactionsArr = item["transactions"];
            transactionsArr.forEach((jsonTransaction) {
              // print(jsonTransaction);
              jsonTransaction["account"] = Account.fromMap(jsonTransaction["account"]);
              jsonTransaction["category"] = Category.fromMap(jsonTransaction["category"]);
              listTransactions
                  .add(Transaction.fromMap(jsonTransaction));
            });
            // print(listTransactions);
            DailyTransaction dailyTransaction = DailyTransaction(
                Date.fromMap(item["_id"]), listTransactions);
            listDailyTransactions.add(dailyTransaction);
          });
          // print(listDailyTransactions);
          return listDailyTransactions;
        } else {
          return Future.error('Error 1!');
        }
      } else {
        return Future.error('Error 2!');
      }
    } catch (e) {
      print(e);
      return Future.error('Execeptional Error !');
    }
  }

  //get all transactions
  // Future<List?> getAllTransactions() async {
  //   try {
  //     List<Transaction> transactionsList = [];
  //     Response response = await get(Uri.parse(endpoint));
  //     if (response.statusCode == 200) {
  //       var jsonData = response.body;
  //       var data = jsonDecode(jsonData);

  //       if (data["success"]) {
  //         var dataArr = data["transactions"];
  //         dataArr.forEach((item) {
  //           transactionsList.add(Transaction.fromMap(item));
  //         });
  //         print(transactionsList);
  //         return transactionsList;
  //       } else {
  //         return Future.error('Error 1!');
  //       }
  //     } else {
  //       return Future.error('Error 2!');
  //     }
  //   } catch (e) {
  //     print(e);
  //     return Future.error('Execeptional Error !');
  //   }
  // }
  
}
