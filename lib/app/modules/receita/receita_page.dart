import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import '../../models/home_model/brasil_model/money_brasil_module.dart';
import '../../models/home_model/itau_model/money_itau_module.dart';

class ReceitaPage extends StatefulWidget {
  const ReceitaPage({Key? key}) : super(key: key);

  @override
  State<ReceitaPage> createState() => _ReceitaPageState();
}

class _ReceitaPageState extends State<ReceitaPage> {
  //ValueNotifier<String> dropvalue = ValueNotifier<String>('');

  final controllerValor = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final formatdata = DateFormat("dd-MM-yyyy");
  final controllerData = TextEditingController();
  late DateTime _selectedDate; // Adicione esta linha para declarar a variável

  @override
  Widget build(BuildContext context) {
    final selectedValue = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, // Define a cor desejada para o ícone de voltar
        ),
        title: Text('Nova receita'),
        actions: [
          IconButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                var valor = double.parse(controllerValor.text);
                if (selectedValue == 'Itau') {
                  final moneyProvider =
                      Provider.of<MoneyItau>(context, listen: false);
                  moneyProvider.deposito(
                    valor: valor,
                    data: _selectedDate,
                    //data: controllerData.text, // Passa a data como parâmetro
                  );
                  print(moneyProvider.historico);
                  print(moneyProvider.dinheiro);
                  Navigator.of(context).pushNamed('/home');
                } else if (selectedValue == 'Banco do Brasil') {
                  final moneyProvider =
                      Provider.of<MoneyBrasil>(context, listen: false);
                  moneyProvider.deposito(valor: valor, date: _selectedDate);
                  Navigator.of(context).pushNamed('/home');
                }
              }
            },
            icon: Icon(
              Icons.save,
            ),
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
                        controller: controllerData,
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
                              firstDate: DateTime(2000),
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
