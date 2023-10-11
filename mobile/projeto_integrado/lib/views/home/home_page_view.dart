import 'dart:ffi';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity_login.dart';
import 'package:projeto_integrado/code/repositories/entities/spending_entity%20copy.dart';
import 'package:projeto_integrado/code/repositories/entities/spending_entity.dart';
import 'package:projeto_integrado/views/home/home_page_bloc.dart';

import '../spending/spending_view.dart';

class HomePageView extends StatefulWidget {
  PersonEntityLogin user;
  IHomePageBloc bloc;
  HomePageView(this.bloc, this.user, {super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(locale: 'pt-br', decimalDigits: 2, symbol: '');

  bool? valid = false;
  Icon visibility = Icon(Icons.visibility_off_outlined);
  String visibilitoff = ' ...';
  @override
  void initState() {
    widget.bloc.getUser(widget.user.id);
    widget.bloc.getSpending(widget.user.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      body: Stack(
        children: [
          _background(),
          _header(),
          _salary(),
          _lastPurchases(),
          gastosItens()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.graphic_eq,
              color: Color.fromRGBO(151, 156, 160, 1),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(
                Icons.add,
                color: Color.fromRGBO(26, 209, 116, 1),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: ((context) => SpendingView(widget.user)));
              },
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: Color.fromRGBO(151, 156, 160, 1),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _background() {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      color: const Color.fromRGBO(18, 18, 18, 1),
    );
  }

  Widget _header() {
    return Positioned(
      child: Container(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(48, 48, 48, 1),
                  Color.fromRGBO(30, 30, 30, 1)
                ]),
          ),
          child: _itensHeader()),
    );
  }

  Widget _itensHeader() {
    return StreamBuilder<PersonEntity>(
        stream: widget.bloc.onFetchingUser,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .07,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .07,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width * .15,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                  'https://cdn.icon-icons.com/icons2/1736/PNG/512/4043260-avatar-male-man-portrait_113269.png')),
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * .03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bem vindo(o),',
                          style: TextStyle(
                              color: Color.fromRGBO(
                                167,
                                167,
                                167,
                                1,
                              ),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 0),
                          child: Text(
                            snapshot.data!.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * .24),
                    GestureDetector(
                      onTap: () {
                        widget.bloc.getUser(widget.user.id);
                        widget.bloc.getSpending(widget.user.id);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .07,
                        width: MediaQuery.of(context).size.width * .14,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(48, 48, 48, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Icon(
                          Icons.refresh_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .11,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .07,
                    ),
                    const Text(
                      'Carregando...',
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(159, 159, 159, 1)),
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }

  Widget _salary() {
    return Positioned(
      top: MediaQuery.of(context).size.height * .23,
      left: MediaQuery.of(context).size.width * .050,
      child: StreamBuilder<PersonEntity>(
          stream: widget.bloc.onFetchingUser,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container();
            }
            if (snapshot.hasData) {
              return Container(
                height: MediaQuery.of(context).size.height * .20,
                width: MediaQuery.of(context).size.width * .9,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromRGBO(36, 36, 36, 1)),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .03,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .035,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .015,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9)),
                                color: Color.fromRGBO(27, 209, 116, 1))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Salário atual: ',
                              style: TextStyle(
                                  color: Color.fromRGBO(159, 159, 159, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              valid == true
                                  ? "R\$ ${snapshot.data!.salary}"
                                  : visibilitoff,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                        ),
                        IconButton(
                          icon: visibility,
                          color: Color.fromRGBO(164, 168, 171, 1),
                          onPressed: () {
                            if (valid == false) {
                              setState(() {
                                valid = true;
                                visibility = Icon(Icons.visibility_off);
                              });
                            } else {
                              setState(() {
                                valid = false;
                                visibility = Icon(Icons.visibility);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .028,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * .004,
                      width: MediaQuery.of(context).size.width * .83,
                      color: const Color.fromRGBO(49, 49, 49, 1),
                    ),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }

  Widget _lastPurchases() {
    return Positioned(
        top: MediaQuery.of(context).size.height * .46,
        left: MediaQuery.of(context).size.width * .050,
        child: Container(
          height: MediaQuery.of(context).size.height * .07,
          width: MediaQuery.of(context).size.width * .9,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color.fromRGBO(36, 36, 36, 1)),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .017,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'Lançamentos',
                    style: TextStyle(
                        color: Color.fromRGBO(27, 209, 116, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * .003,
                width: MediaQuery.of(context).size.width * .9,
                color: const Color.fromRGBO(49, 49, 49, 1),
              ),
            ],
          ),
        ));
  }

  Widget gastosItens() {
    return Positioned(
        top: MediaQuery.of(context).size.height * .52,
        left: MediaQuery.of(context).size.width * .050,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width * .9,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Color.fromRGBO(36, 36, 36, 1)),
            child: StreamBuilder<List<SpendingEntity>>(
                stream: widget.bloc.onFetchingSpending,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              itemBuilder: (context, index) {
                                return itens(
                                    snapshot.data![index].category,
                                    snapshot.data![index].date,
                                    snapshot.data![index].value);
                              }),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ));
  }

  Widget itens(String categoria, String data, String valor) {
    return SizedBox(
      height: 70,
      width: 400,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 5),
            child: Icon(
              categoria == "Alimentação"
                  ? Icons.restaurant
                  : categoria == "Lazer"
                      ? Icons.sports_baseball
                      : categoria == "Saúde"
                          ? Icons.health_and_safety
                          : categoria == "Casa"
                              ? Icons.home
                              : categoria == "Investimento"
                                  ? Icons.attach_money_outlined
                                  : categoria == "Outros"
                                      ? Icons.check
                                      : Icons.widgets,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          SizedBox(
            height: 50,
            width: 110,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 01.0),
              title: Text(categoria,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(data,
                  style: const TextStyle(
                      color: Color.fromRGBO(159, 159, 159, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(
            width: 110,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text('-R\$ $valor',
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
