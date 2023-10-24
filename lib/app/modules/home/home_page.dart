import 'package:flutter/material.dart';
import 'package:meu_dinheiro/app/modules/home/drawer_home.dart';
import 'package:provider/provider.dart';

import '../../models/home_model/brasil_model/money_brasil_module.dart';
import '../../models/home_model/itau_model/money_itau_module.dart';

class HomePage extends StatelessWidget {
  //valores inicial do botão drop
  final dropvalue = ValueNotifier('');
  //lista de opções
  final dropOpcoes = ['Itau', 'Banco do Brasil'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.amber,
      ),
      //menu lateral
      drawer: DrawerHome(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text(
                'SALDO TOTAL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                //Widget resposável por capturar os dados das classes e mostrar nos textos
                child: ValueListenableBuilder<String>(
                  valueListenable: dropvalue,
                  builder: (BuildContext context, String value, _) {
                    //innstâncias das classes
                    final moneyItau = Provider.of<MoneyItau>(context);
                    final moneyBrasil = Provider.of<MoneyBrasil>(context);

                    if (value == 'Itau') {
                      return Text('Saldo: ${moneyItau.dinheiro}');
                    } else if (value == 'Banco do Brasil') {
                      return Text('Saldo: ${moneyBrasil.dinheiro}');
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: dropvalue,
                builder: (BuildContext contex, String value, _) {
                  return Center(
                    child: SizedBox(
                      width: 300,
                      //impede do widget estourar a tela
                      child: SafeArea(
                        //botão drop dawn
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          validator: (data) {
                            if (data == null) {
                              return 'informe a conta';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.deepPurpleAccent),
                            ),
                          ),
                          icon: const Icon(Icons.monetization_on_sharp),
                          hint: const Text('Contas'),
                          //ao selecionar
                          onChanged: (escolha) {
                            dropvalue.value = escolha.toString();
                            if (dropvalue.value == 'Itau') {
                              print('itau');
                            }
                            if (dropvalue.value == 'Banco do Brasil') {
                              print('Banco do brasil');
                            }
                          },
                          //passando os valores para uma lista
                          items: dropOpcoes
                              .map(
                                (op) => DropdownMenuItem(
                                  child: Text(op),
                                  value: op,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            String selectedValue = dropvalue.value;
                            Navigator.of(context).pushNamed('/receita',
                                arguments: selectedValue);
                          },
                          icon: Icon(Icons.add),
                        ),
                        Text('Nova receita')
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        //botão icone
                        IconButton(
                          onPressed: () {
                            String selectedValue = dropvalue.value;
                            Navigator.of(context).pushNamed('/despesa',
                                arguments: selectedValue);
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text('Nova despesa')
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //botao histórico
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Define o raio de borda desejado
                    ),
                  ), // Define a largura e a cor da borda,
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry?>(
                          (Set<MaterialState> states) {
                    return EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 100); // Padding padrão do botão
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                    return Colors.grey.shade300; // Cor padrão do botão
                  }),
                ),
                onPressed: () {
                  if (dropvalue.value == 'Itau') {
                    Navigator.of(context).pushNamed('/históricoItau');
                  } else if (dropvalue.value == 'Banco do Brasil') {
                    print('oi');
                    Navigator.of(context).pushNamed('/históricoBrasil');
                  }
                },
                child: Text(
                  'Histórico',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
