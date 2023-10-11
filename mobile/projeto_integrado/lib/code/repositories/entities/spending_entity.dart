class SpendingEntity {
  final String id;
  late final String category;
  late final String date;
  late final String value;

  SpendingEntity(
      {required this.id,
      required this.category,
      required this.date,
      required this.value});

  SpendingEntity.fromJSON(Map<String, dynamic> json)
      : id = json["id"] as String,
        category = json["category"] as String,
        date = json["date"] as String,
        value = json["value"] as String;
  Map<String, dynamic> toJson() {
    return {"id": id, "category": category, "date": date, "value": value};
  }
}
