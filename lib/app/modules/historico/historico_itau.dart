import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../models/home_model/itau_model/money_itau_module.dart';
import '../../models/home_model/itau_model/transacao_itau_module.dart';

class HistoricoItau extends StatelessWidget {
  const HistoricoItau({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moneyProvider = Provider.of<MoneyItau>(context);
    final historico = moneyProvider.historico;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        iconTheme: IconThemeData(
          color: Colors.black, // Define a cor desejada para o ícone de voltar
        ),
        title: Text('Histórico Itau',style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: ListView.builder(
        itemCount: historico.length,
        itemBuilder: (context, index) {
          TransacaoItau transacao = historico[index];
          return ListTile(
            title: Text('Valor: ${transacao.valor}'),
            subtitle: Text('Data: ${transacao.data}'),
          );
        },
      ),
    );
  }
}
