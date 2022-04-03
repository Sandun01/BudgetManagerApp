import 'package:flutter/material.dart';
import 'package:budget_recorder/widgets/card/category_card.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  final List<String> allCategories = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.add_circle_rounded,
                size: 30.0,
              ),
            ),
          ),
        ],
        actionsIconTheme: const IconThemeData(
          size: 30.0,
          color: Colors.white,
          opacity: 10.0,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: allCategories.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryCard(
              name: allCategories[index],
              descriptions: "descriptions",
              type: "type",
            );
          },
        ),
      ),
    );
  }
}
