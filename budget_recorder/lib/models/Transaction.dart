class Transaction {
  String transactionID, name, description, type;
  double amount;
  DateTime date;

  Transaction(this.transactionID, this.name, this.amount, this.description,
      this.type, this.date);

  static Transaction fromMap(Map map) {
    return Transaction(
      map['_id'].toString(),
      map['name'].toString(),
      double.parse(map['amount'].toString()),
      map['description'].toString(),
      map['type'].toString(),
      DateTime.parse(map['date'].toString()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": this.transactionID,
      "name": this.name,
      "amount": this.amount,
      "description": this.description,
      "type": this.type,
    };
  }
}
