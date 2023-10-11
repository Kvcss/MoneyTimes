import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity_login.dart';

abstract class IPersonRepository {
  Future createUser(PersonEntity person);
  Future<PersonEntityLogin> login(PersonEntity person);
}

class PersonRepository implements IPersonRepository {
  @override
  Future createUser(PersonEntity person) async {
    Response response;
    var dio = Dio();
    try {
      response = await dio.post(
          'https://rest-api-moneytime.herokuapp.com/auth/register',
          data: {
            'name': person.name,
            'email': person.email,
            'password': person.password,
            'confirmPassWord': person.password,
            'salary': person.salary
          });
      print(response.statusCode);
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<PersonEntityLogin> login(PersonEntity person) async {
    Response response;
    var dio = Dio();
    response = await dio
        .post('https://rest-api-moneytime.herokuapp.com/auth/login', data: {
      'email': person.email,
      'password': person.password,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return PersonEntityLogin.fromJSON(
          json.decode(json.encode(response.data)) as Map<String, dynamic>);
    } else {
      return PersonEntityLogin(
          name: '', email: '', salary: '', msg: '', id: '');
    }
  }
}
