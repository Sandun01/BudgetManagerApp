class Category {
  String cID, name, type, description;

  Category(this.cID, this.name, this.type, this.description);

  static Category fromMap(Map map) {
    return Category(map['_id'].toString(), map['name'].toString(),
        map['type'].toString(), map['description'].toString());
  }

}
