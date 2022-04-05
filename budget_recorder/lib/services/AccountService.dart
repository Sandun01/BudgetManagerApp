import 'dart:convert';
import 'package:budget_recorder/models/Account.dart';
import 'package:http/http.dart';

class AccountService {
  static const String endpoint = "http://10.0.2.2:5000/api/accounts/";

  const AccountService();

  Future<List?> getAllAccounts() async {
    //get all accounts
    try {
      List<Account> accountList = [];
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var data = jsonDecode(jsonData);

        if (data["success"]) {
          var dataArr = data["accounts"];
          dataArr.forEach((item) {
            accountList.add(Account.fromMap(item));
          });
          print(accountList);
          return accountList;
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
