import 'package:flutter/material.dart';
import 'package:meu_dinheiro/app/modules/auth/login/login_page.dart';
import 'package:meu_dinheiro/app/modules/auth/registro/registro_page.dart';
import 'package:meu_dinheiro/app/modules/despesa/despesa_page.dart';
import 'package:meu_dinheiro/app/modules/historico/historico_brasil.dart';
import 'package:meu_dinheiro/app/modules/historico/historico_itau.dart';
import 'package:meu_dinheiro/app/modules/home/home_page.dart';

import 'modules/receita/receita_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  //inicio do flutter

  @override
  Widget build(BuildContext context) {
    //classe contendo todos os materiais(componentes)
    return MaterialApp(
      //desativa o simbolo de debug
      debugShowCheckedModeBanner: false,
      //todas as rotas(navegação) do meu app
      //ou seja, foi definido o nome de cada rota
      //com isso eu só preciso passar o nome da rota que ele chama a classe
      routes: {
        //rota inicial é a que tem somente a '/' (Login Page)
        '/': (_) => LoginPage(),
        '/registro': (_) => RegistroPage(),
        '/home': (_) => HomePage(),
        '/receita':(_)=> ReceitaPage(),
        '/despesa':(_)=> DespesaPage(),
        '/históricoItau': (_)=> HistoricoItau(),
        '/históricoBrasil': (_)=> HistoricoBrasil(),
      },
    );
  }
}
