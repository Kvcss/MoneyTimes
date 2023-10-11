class SpendingEntity1 {
  final String id;
  final String id1;
  late final String category;
  late final String date;
  late final String value;
  late final String v;

  SpendingEntity1(
      {required this.id1,
      required this.id,
      required this.category,
      required this.date,
      required this.value,
      required this.v});

  SpendingEntity1.fromJSON(Map<String, dynamic> json)
      : id1 = json["_id"] as String,
        id = json["id"] as String,
        category = json["category"] as String,
        date = json["date"] as String,
        value = json["value"] as String,
        v = json["__v"] as String;

  Map<String, dynamic> toJson() {
    return {
      "_id": id1,
      "id": id,
      "category": category,
      "date": date,
      "value": value,
      "__v": v
    };
  }
}
