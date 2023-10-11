import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity.dart';
import 'package:projeto_integrado/code/repositories/entities/person_entity_login.dart';
import 'package:projeto_integrado/code/repositories/entities/spending_entity.dart';

class SpendingView extends StatefulWidget {
  PersonEntityLogin user;
  SpendingView(this.user, {super.key});

  @override
  State<SpendingView> createState() => _SpendingViewState();
}

class _SpendingViewState extends State<SpendingView> {
  final TextEditingController _salary = TextEditingController();
  final CurrencyTextInputFormatter _formatter =
      CurrencyTextInputFormatter(locale: 'pt-br', decimalDigits: 2, symbol: '');
  Color backgroundIcon = const Color.fromRGBO(90, 90, 90, 1);
  Color backgroundIcon2 = const Color.fromRGBO(27, 209, 116, 1);
  DateTime date = DateTime(2022, 12, 04);
  String? category;
  bool? valid1 = false;
  bool? valid2 = false;
  bool? valid3 = false;
  bool? valid4 = false;
  bool? valid5 = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            width: MediaQuery.of(context).size.width * 0.96,
            child: Container(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: const Color.fromRGBO(36, 36, 36, 1),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Insira um valor',
                          style: TextStyle(
                              color: Color.fromRGBO(159, 159, 159, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'R\$ ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(159, 159, 159, 1),
                              ),
                            ),
                            SizedBox(
                              height: 55,
                              width: 100,
                              child: TextFormField(
                                controller: _salary,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: _formatter.format('0000'),
                                    hintStyle: const TextStyle(
                                        color:
                                            Color.fromRGBO(159, 159, 159, 1))),

                                inputFormatters: <TextInputFormatter>[
                                  _formatter
                                ],
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(159, 159, 159, 1)),
                                onChanged: (value) {
                                  setState(() {
                                    category = value;
                                  });
                                },

                                keyboardType: TextInputType.number,
                                // Only numbers can be entered
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        width: MediaQuery.of(context).size.height * 0.5,
                        color: const Color.fromRGBO(18, 18, 18, 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 10, top: 6),
                              child: Text('Categoria',
                                  style: TextStyle(
                                    color: Color.fromRGBO(159, 159, 159, 1),
                                    fontSize: 16,
                                  )),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 70,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: valid1 == false
                                        ? const Color.fromRGBO(90, 90, 90, 1)
                                        : const Color.fromRGBO(27, 209, 116, 1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                category = 'Alimentação';
                                                valid1 = true;
                                                valid2 = false;
                                                valid3 = false;
                                                valid4 = false;
                                                valid5 = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.restaurant,
                                              size: 40,
                                            )),
                                      ),
                                      const Text(
                                        'Alimentação',
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 70,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: valid2 == false
                                        ? const Color.fromRGBO(90, 90, 90, 1)
                                        : const Color.fromRGBO(27, 209, 116, 1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                category = 'Lazer';
                                                valid1 = false;
                                                valid2 = true;
                                                valid3 = false;
                                                valid4 = false;
                                                valid5 = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.sports_baseball,
                                              size: 40,
                                            )),
                                      ),
                                      const Text(
                                        'Lazer',
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 70,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: valid3 == false
                                        ? const Color.fromRGBO(90, 90, 90, 1)
                                        : const Color.fromRGBO(27, 209, 116, 1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                category = 'Saúde';
                                                valid1 = false;
                                                valid2 = false;
                                                valid3 = true;
                                                valid4 = false;
                                                valid5 = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.health_and_safety,
                                              size: 40,
                                            )),
                                      ),
                                      const Text(
                                        'Saúde',
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 70,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: valid3 == false
                                        ? const Color.fromRGBO(90, 90, 90, 1)
                                        : const Color.fromRGBO(27, 209, 116, 1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                category = 'Casa';
                                                valid1 = false;
                                                valid2 = false;
                                                valid3 = false;
                                                valid4 = true;
                                                valid5 = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.home,
                                              size: 40,
                                            )),
                                      ),
                                      const Text(
                                        'Casa',
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 70,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: valid4 == false
                                        ? const Color.fromRGBO(90, 90, 90, 1)
                                        : const Color.fromRGBO(27, 209, 116, 1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                category = 'Investimento';
                                                valid1 = false;
                                                valid2 = false;
                                                valid3 = false;
                                                valid4 = false;
                                                valid5 = true;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.attach_money_outlined,
                                              size: 40,
                                            )),
                                      ),
                                      const Text(
                                        'Investimento',
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  height: 70,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: valid5 == false
                                        ? const Color.fromRGBO(90, 90, 90, 1)
                                        : const Color.fromRGBO(27, 209, 116, 1),
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                category = 'Outros';
                                                valid1 = false;
                                                valid2 = false;
                                                valid3 = false;
                                                valid4 = false;
                                                valid5 = true;
                                              
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.check,
                                              size: 40,
                                            )),
                                      ),
                                      const Text(
                                        'Outros',
                                        style: TextStyle(fontSize: 13),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 3,
                              width: MediaQuery.of(context).size.height * 1,
                              color: const Color.fromRGBO(36, 36, 36, 1),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                'Data',
                                style: TextStyle(
                                  color: Color.fromRGBO(159, 159, 159, 1),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0, top: 0),
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        DateTime? newDate =
                                            await showDatePicker(
                                                context: context,
                                                initialDate: date,
                                                firstDate: DateTime(1900),
                                                lastDate: DateTime(2100),
                                                builder:
                                                    (context, child) => Theme(
                                                          data: ThemeData().copyWith(
                                                              colorScheme: const ColorScheme.dark(
                                                                  primary: Color.fromRGBO(
                                                                      27,
                                                                      209,
                                                                      116,
                                                                      1),
                                                                  surface:
                                                                      Color.fromRGBO(
                                                                          27,
                                                                          209,
                                                                          116,
                                                                          1),
                                                                  onSurface:
                                                                      Color.fromRGBO(
                                                                          159,
                                                                          159,
                                                                          159,
                                                                          1)),
                                                              dialogBackgroundColor:
                                                                  const Color.fromRGBO(
                                                                      36, 36, 36, 1)),
                                                          child: child!,
                                                        ));
                                        if (newDate == null) return;

                                        setState(() {
                                          date = newDate;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.calendar_month,
                                        color: Color.fromRGBO(159, 159, 159, 1),
                                      )),
                                  const SizedBox(width: 2),
                                  Text(
                                    '${date.day}/${date.month}/${date.year}',
                                    style: const TextStyle(
                                      color: Color.fromRGBO(159, 159, 159, 1),
                                      fontSize: 21,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: FloatingActionButton(
                                    backgroundColor:
                                        const Color.fromRGBO(27, 209, 116, 1),
                                    onPressed: () async {
                                      double valorAtualizado = double.parse(
                                              widget.user.salary
                                                  .replaceAll(',', '.')) -
                                          double.parse(_salary.text
                                              .replaceAll(',', '.'));
                                      bool? valid = await inserirGasto(
                                          SpendingEntity(
                                              id: widget.user.id,
                                              category: category!,
                                              date:
                                                  '${date.day}/${date.month}/${date.year}',
                                              value: _salary.text));
                                      if (valid!) {
                                        bool? valid2 = await updateUser(
                                            valorAtualizado.toString(),
                                            widget.user.id);
                                        if (valid2!) {
                                          Navigator.pop(context);
                                        }
                                      }
                                    },
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Future updateUser(String salary, String id) async {
    Response response;
    var dio = Dio();
    try {
      response = await dio.patch(
          'https://rest-api-moneytime.herokuapp.com/update/salary/$id',
          data: {
            'salary': salary,
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future inserirGasto(SpendingEntity person) async {
    Response response;
    var dio = Dio();
    try {
      response = await dio.post(
          'https://rest-api-moneytime.herokuapp.com/gastos/inserir',
          data: {
            'id': person.id,
            'category': person.category,
            'date': person.date,
            'value': person.value,
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
}
