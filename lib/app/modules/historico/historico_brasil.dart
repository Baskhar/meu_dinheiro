import 'package:flutter/material.dart';
import 'package:meu_dinheiro/app/models/home_model/brasil_model/money_brasil_module.dart';
import 'package:meu_dinheiro/app/models/home_model/brasil_model/transacao_brasil_module.dart';
import 'package:provider/provider.dart';

class HistoricoBrasil extends StatefulWidget {
  const HistoricoBrasil({Key? key}) : super(key: key);

  @override
  State<HistoricoBrasil> createState() => _HistoricoBrasilState();
}

class _HistoricoBrasilState extends State<HistoricoBrasil> {
  @override
  Widget build(BuildContext context) {
    final moneyProvider = Provider.of<MoneyBrasil>(context);
    final historico = moneyProvider.historico;
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black, // Define a cor desejada para o ícone de voltar
        ),
        backgroundColor: Colors.amber,
        title: Text('Histórico Banco do Brasil',style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: ListView.builder(
        itemCount: historico.length,
        itemBuilder: (context, index) {
          TransacaoBrasil transacao = historico[index];
          return ListTile(
            title: Text('Valor: ${transacao.valor}'),
            subtitle: Text('Data: ${transacao.data}'),
          );
        },
      ),
    );
  }
}

