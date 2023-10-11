import 'package:flutter/cupertino.dart';
import 'package:projeto_integrado/views/register/creat_account_view.dart';
import 'package:dependencies/dependencies.dart';

class AppRoutes {
  static const String createAccount = "/account";

  static Map<String, WidgetBuilder> get routes => {
        createAccount: (_) =>
            InjectorRegistry.instance.get().get<CreateAccountView>()
      };
}
