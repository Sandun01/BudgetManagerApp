import 'dart:convert';
import 'package:budget_recorder/models/Category.dart';
import 'package:http/http.dart';

class CategoryService {
  static const String endpoint = "http://10.0.2.2:5000/api/categories/";

  const CategoryService();

  Future<List?> getAllCategories() async {
    //get all categories
    try {
      List<Category> categoryList = [];
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        var jsonData = response.body;
        var data = jsonDecode(jsonData);

        if (data["success"]) {
          var dataArr = data["categories"];
          dataArr.forEach((item) {
            categoryList.add(Category.fromMap(item));
          });
          print(categoryList);
          return categoryList;
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
