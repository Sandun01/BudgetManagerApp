import 'package:flutter/material.dart';

//
// All view(List View) - Category Card
//

class CategoryCard extends StatefulWidget {
  final String name, descriptions, type;
  const CategoryCard({
    Key? key,
    required this.name,
    required this.descriptions,
    required this.type,
  }) : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // widget.name,
                      "Category: ${widget.name}",
                      style: const TextStyle(
                        // color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      // widget.name,
                      "Type: ${widget.type}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      // widget.name,
                      "Description: ${widget.descriptions}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Edit
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/category/manage");
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.green[700],
                      ),
                    ),
                    // Delete
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            color: Colors.black54,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
