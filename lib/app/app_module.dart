import 'package:flutter/material.dart';
import 'package:meu_dinheiro/app/models/home_model/brasil_model/money_brasil_module.dart';
import 'package:provider/provider.dart';

import 'app_widget.dart';
import 'models/home_model/itau_model/money_itau_module.dart';

import 'modules/home/controller/controller_home.dart';

class AppModule extends StatelessWidget {
  const AppModule({Key? key}) : super(key: key);

  //classe resposaável por gerenciar as dependências(através do pacote provider)
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MoneyItau>(
          create: (context) => MoneyItau(),
        ),
        ChangeNotifierProvider<MoneyBrasil>(
          create: (context) => MoneyBrasil(),
        ),
        ChangeNotifierProvider<DropDownState>(
          create: (context) => DropDownState(),
        ),
      ],
      //filho do multi provider, AppModule vai chamar o seu filho assim que for executada
      child: AppWidget(),
    );
  }
}
