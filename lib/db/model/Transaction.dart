final String tableTransaction = "transactions";

class TransactionField {
  static final List<String> values = [id, description, amount, timeStamp];

  static final String id = "_id";
  static final String description = "description";
  static final String amount = "amount";
  static final String timeStamp = "time_stamp";
}

class TransactionInfo {
  int? id;
  String? description;
  double? amount;
  int? timeStamp;

  TransactionInfo(
      {int? id,
        required String? description,
        required double? amount,
        required int? timeStamp}) {
    this.id = id;
    this.description = description;
    this.amount = amount;
    this.timeStamp = timeStamp;
  }

  TransactionInfo copy(
      {int? id, String? description, double? amount, int? timeStamp}) =>
      TransactionInfo(
          id: id ?? this.id,
          description: description ?? this.description,
          amount: amount ?? this.amount,
          timeStamp: timeStamp ?? this.timeStamp);

  static TransactionInfo fromJson(Map<String, Object?> json) => TransactionInfo(
      id: json[TransactionField.id] as int,
      description: json[TransactionField.description] as String?,
      amount: json[TransactionField.amount] as double?,
      timeStamp: json[TransactionField.timeStamp] as int?);

  Map<String, Object?> toJson() => {
    TransactionField.id: this.id,
    TransactionField.description: this.description,
    TransactionField.amount: this.amount,
    TransactionField.timeStamp: this.timeStamp
  };
}
