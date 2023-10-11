class PersonEntityLogin {
  final String id;
  final String name;
  final String email;
  final String salary;
  final String msg;

  PersonEntityLogin(
      {required this.id,
      required this.name,
      required this.email,
      required this.salary,
      required this.msg});

  PersonEntityLogin.fromJSON(Map<String, dynamic> json)
      : id = json["_id"] as String,
        name = json["name"] as String,
        email = json["email"] as String,
        salary = json["salary"] as String,
        msg = json["msg"] as String;
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "email": email,
      "salary": salary,
      "msg": msg
    };
  }
}
