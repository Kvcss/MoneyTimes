class PersonEntity {
  final String name;
  final String email;
  final String password;
  final String salary;

  PersonEntity(
      {required this.name,
      required this.email,
      required this.password,
      required this.salary});

  PersonEntity.fromJSON(Map<String, dynamic> json)
      : name = json["name"] as String,
        email = json["email"] as String,
        password = json["password"] as String,
        salary = json["salary"] as String;
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "salary": salary
    };
  }
}
