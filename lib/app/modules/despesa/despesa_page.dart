import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/home_model/brasil_model/money_brasil_module.dart';
import '../../models/home_model/itau_model/money_itau_module.dart';

class DespesaPage extends StatefulWidget {
  const DespesaPage({Key? key}) : super(key: key);

  @override
  State<DespesaPage> createState() => _DespesaPageState();
}

class _DespesaPageState extends State<DespesaPage> {
  final controllerValor = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final formatdata = DateFormat("dd-MM-yyyy");
  late DateTime _selectedDate;
  late String _selectedOption; // Adicione esta linha

  @override
  Widget build(BuildContext context) {
    final selectedValue = ModalRoute.of(context)?.settings.arguments as String?;
    _selectedOption = selectedValue ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, // Define a cor desejada para o ícone de voltar
        ),
        title: Text('Nova despesa'),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var valor = double.parse(controllerValor.text);
                if (selectedValue == 'Itau') {
                  final moneyProvider = Provider.of<MoneyItau>(context, listen: false);
                  moneyProvider.saque(valor: valor, data: _selectedDate);
                  print(moneyProvider.dinheiro);
                  Navigator.of(context).pushNamed('/home');
                } else if (selectedValue == 'Banco do Brasil') {
                  final moneyProvider = Provider.of<MoneyBrasil>(context, listen: false);
                  moneyProvider.saque(valor: valor,date:_selectedDate);
                  Navigator.of(context).pushNamed('/home');
                }
              }
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Consumer<MoneyItau>(
        builder: (context, moneyProvider, _) {
          return Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30, top: 30),
              child: Column(
                children: [
                  Text(
                    'Valor',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: controllerValor,
                        keyboardType: TextInputType.number, // Apenas números
                        decoration: InputDecoration(
                          labelText: 'Valor',
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (valor) {
                          if (valor == null || valor.isEmpty) {
                            return 'Informe o valor';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DateTimeField(
                        decoration: InputDecoration(
                            labelText: "Data",
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(70),borderSide: BorderSide.none)),
                        format: formatdata,

                        onChanged: (DateTime? selectedDate) {
                          setState(() {
                            _selectedDate = selectedDate!;
                          });
                          // setState(() {
                          //   userNametxt = controllerDATA.text;
                          //   dia = textEntered!.weekday;
                          //   teste += 1;
                          //   print(controllerDATA.text);
                          //   print(dayoff);
                          //
                          // });
                          // initProcura(controllerDATA.text);
                        },
                        onShowPicker: (context, currentValue) {
                          return showDatePicker(
                              context: context,
                              firstDate: DateTime(2022),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                        },
                        validator: (data) {
                          if (data == null) {
                            return 'Informe a data';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //Text('Saldo: ${moneyProvider.dinheiro}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
