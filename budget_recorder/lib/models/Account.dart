class Account {
  String accID, name, description;
  double amount;

  Account(this.accID, this.name, this.amount, this.description);

  static Account fromMap(Map map) {
    return Account(
      map['_id'].toString(),
      map['name'].toString(),
      double.parse(map['amount'].toString()),
      map['description'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": this.accID,
      "name": this.name,
      "amount": this.amount,
      "description": this.description,
    };
  }
}