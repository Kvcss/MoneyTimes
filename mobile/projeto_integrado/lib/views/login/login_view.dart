import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity_login.dart';
import 'package:projeto_integrado/views/home/home_page_bloc.dart';
import 'package:projeto_integrado/views/home/home_page_view.dart';
import 'package:projeto_integrado/views/login/login_view_bloc.dart';

import '../../code/repositories/entities/person_entity.dart';

class LoginView extends StatefulWidget {
  final ILoginViewBloc bloc;
  const LoginView(this.bloc, {super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _salary = TextEditingController();

  Color continuar = Color.fromRGBO(3, 28, 15, 1);
  Color background = Color.fromRGBO(26, 209, 116, 1);
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(locale: 'pt-br', decimalDigits: 2, symbol: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Stack(
            children: [
              _back(),
              _titleCreate(),
              _infologin(),
              _login(),
              _continue()
            ],
          ),
        ),
      ),
    );
  }

  Widget _back() {
    return Positioned(
        top: MediaQuery.of(context).size.height * .08,
        left: MediaQuery.of(context).size.width * .04,
        child: Container(
          height: MediaQuery.of(context).size.height * .05,
          color: const Color.fromRGBO(18, 18, 18, 1),
          width: MediaQuery.of(context).size.height * 1,
          child: Row(
            children: [
              SizedBox(
                child: GestureDetector(
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(159, 159, 159, 1),
                    ),
                    onTap: () => Navigator.pop(context)),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.30),
              const Text(
                'Login',
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }

  Widget _titleCreate() {
    return Positioned(
      top: MediaQuery.of(context).size.height * .12,
      left: MediaQuery.of(context).size.height * .15,
      child: SizedBox(
          height: 150, width: 150, child: Image.asset('assets/register.png')),
    );
  }

  Widget _infologin() {
    return Positioned(
        top: MediaQuery.of(context).size.height * .33,
        left: MediaQuery.of(context).size.width * .21,
        child: SizedBox(
            width: MediaQuery.of(context).size.width * .55,
            child: const Text(
                'Para acessar o aplicativo insira seu email e senha:)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(
                    167,
                    167,
                    167,
                    1,
                  ),
                  overflow: TextOverflow.clip,
                ))));
  }

  Widget _login() {
    return Positioned(
      top: MediaQuery.of(context).size.height * .45,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .60,
          width: MediaQuery.of(context).size.width * .90,
          child: Column(
            children: [
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Qual é o seu email ? ',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Insira seu e-mail',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(69, 69, 69, 1),
                                fontSize: 20)),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),

                        keyboardType: TextInputType.emailAddress,
                        // Only numbers can be entered
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Qual é sua senha ? ',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '*******',
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(69, 69, 69, 1),
                                fontSize: 20)),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _password,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        // Only numbers can be entered
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _continue() {
    return Positioned(
        top: MediaQuery.of(context).size.height * .92,
        child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height * .08,
            color: background,
            width: MediaQuery.of(context).size.height * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Continuar',
                        style: TextStyle(
                            color: continuar,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Icon(Icons.arrow_forward)],
                    )
                  ],
                )
              ],
            ),
          ),
          onTap: () async {
            try {
              setState(() {
                background = const Color.fromRGBO(121, 220, 162, 1);
                // continuar = const Color.fromRGBO(7, 66, 35, 1);
              });
              PersonEntityLogin? valid = await widget.bloc.login(PersonEntity(
                  name: _nameController.text,
                  email: _emailController.text,
                  password: _password.text,
                  salary: _salary.text));
              if (valid!.name != '') {
                // ignore: use_build_context_synchronously
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePageView(HomePageBloc(), valid)));
              }
            } catch (e) {
              print(e.toString());
            }
          },
        ));
  }
}
