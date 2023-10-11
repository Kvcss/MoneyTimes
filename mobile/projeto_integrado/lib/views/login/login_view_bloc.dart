import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity.dart';
import 'package:projeto_integrado/code/repositories/person_rpository.dart';

import '../../code/repositories/entities/person_entity_login.dart';

abstract class ILoginViewBloc {
  Future<PersonEntityLogin?> login(PersonEntity user);
}

class LoginViewBloc extends BlocBase with ILoginViewBloc {
  final IPersonRepository _personRepository;
  LoginViewBloc(this._personRepository);

  @override
  Future<PersonEntityLogin> login(PersonEntity user) async {
    PersonEntityLogin validUser;
    try {
      validUser = await _personRepository.login(user);

      return validUser;
    } catch (e) {
      print(e.toString());
      return PersonEntityLogin(
          name: '', email: '', salary: '', id: '', msg: '');
    }
  }
}
