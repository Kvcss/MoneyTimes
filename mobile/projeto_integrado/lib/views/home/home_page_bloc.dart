import 'dart:convert';
import 'dart:core';
import 'dart:core';

import 'package:dio/dio.dart';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:projeto_integrado/code/repositories/entities/spending_entity%20copy.dart';
import 'package:projeto_integrado/code/repositories/entities/spending_entity.dart';
import 'package:projeto_integrado/code/repositories/entities/spending_entity.dart';

import '../../code/repositories/entities/person_entity.dart';
import 'package:rxdart/subjects.dart';

abstract class IHomePageBloc {
  Stream<PersonEntity> get onFetchingUser;
  Stream<List<SpendingEntity>> get onFetchingSpending;
  Future<void> getUser(String id);
  Future<void> getSpending(String id);
}

class HomePageBloc extends BlocBase with IHomePageBloc {
  final _fetchingDataController = BehaviorSubject<PersonEntity>();
  final _fetchingSpendingController = BehaviorSubject<List<SpendingEntity>>();
  @override
  Future<void> getUser(String id) async {
    Response response;
    var dio = Dio();
    try {
      response =
          await dio.get('https://rest-api-moneytime.herokuapp.com/user/$id');
      if (response.statusCode == 200) {
        _fetchingDataController
            .add(PersonEntity.fromJSON(jsonDecode(response.toString())));
      } else {}
    } catch (e) {
      print(e.toString());
      _fetchingDataController.addError(e);
    }
  }

  @override
  Future<void> getSpending(String id) async {
    Response response;
    var dio = Dio();
    try {
      response =
          await dio.get('https://rest-api-moneytime.herokuapp.com/gastos/$id');
      if (response.statusCode == 200) {
        List<dynamic> spending = response.data;

        _fetchingSpendingController
            .add(spending.map((f) => SpendingEntity.fromJSON(f)).toList());
      } else {}
    } catch (e) {
      print(e.toString());
      _fetchingSpendingController.addError(e);
    }
  }

  @override
  Stream<PersonEntity> get onFetchingUser => _fetchingDataController.stream;

  @override
  Stream<List<SpendingEntity>> get onFetchingSpending =>
      _fetchingSpendingController;
}
