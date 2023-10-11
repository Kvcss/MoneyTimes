import 'package:flutter/material.dart';
import 'package:projeto_integrado/code/repositories/person_rpository.dart';
import 'package:projeto_integrado/views/login/login_view.dart';
import 'package:projeto_integrado/views/login/login_view_bloc.dart';
import 'package:projeto_integrado/views/register/creat_account_view.dart';
import 'package:projeto_integrado/views/register/creat_account_view_bloc.dart';

import '../home/home_page_view.dart';

class StartPageView extends StatefulWidget {
  const StartPageView({super.key});

  @override
  State<StartPageView> createState() => _StartPageViewState();
}

class _StartPageViewState extends State<StartPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width * .8,
                  child: Image.asset('assets/tempoDinheiro4.png')),
            ),
            const Text(
              'Você sabe, tempo é',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              'Dinheiro',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02),
            const Text(
              'Organize seu dinheiro em poucos minutos e',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(
                  167,
                  167,
                  167,
                  1,
                ),
              ),
            ),
            const Text(
              'não perca tempo. Tenha tudo sob controle',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(
                  167,
                  167,
                  167,
                  1,
                ),
              ),
            ),
            const Text(
              'no seu celular ou computador',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(
                  167,
                  167,
                  167,
                  1,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .09),
            GestureDetector(
              onTap: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountView(
                            CreateAccountViewBloc(PersonRepository()))));
              }),
              child: Container(
                height: MediaQuery.of(context).size.height * .075,
                width: MediaQuery.of(context).size.width * .85,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(26, 209, 116, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text("Criar uma conta",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .03),
            GestureDetector(
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(
                      167,
                      167,
                      167,
                      1,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LoginView(LoginViewBloc(PersonRepository()))));
                }),
          ],
        ));
  }
}
