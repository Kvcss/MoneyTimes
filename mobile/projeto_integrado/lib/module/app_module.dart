import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_integrado/code/repositories/person_rpository.dart';
import 'package:projeto_integrado/module/app_widget.dart';
import 'package:projeto_integrado/views/start/start_page_view.dart';
import 'package:projeto_integrado/views/register/creat_account_view.dart';
import 'package:projeto_integrado/views/register/creat_account_view_bloc.dart';

import '../main.dart';

class AppModule extends Module {
  @override
  // TODO: implement binds
  List<Bind> get binds {
    return [
      Bind((i) => CreateAccountViewBloc(i.get())),
      Bind((i) => PersonRepository())
    ];
  }

  @override
  Widget get bootstrap => const MyApp();

  @override
  // TODO: implement routers
  List get routers => throw UnimplementedError();
}
