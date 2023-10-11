import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity.dart';
import 'package:projeto_integrado/code/repositories/person_rpository.dart';

abstract class ICreateAccountViewBloc {
  Future<bool?> createUser(PersonEntity user);
}

class CreateAccountViewBloc extends BlocBase with ICreateAccountViewBloc {
  final IPersonRepository _personRepository;
  CreateAccountViewBloc(this._personRepository);

  @override
  Future<bool?> createUser(PersonEntity user) async {
    bool validUser = false;
    try {
      validUser = await _personRepository.createUser(user);

      if (validUser) {
        print('conseguiu inserir');
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
