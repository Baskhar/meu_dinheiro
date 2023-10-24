import 'package:flutter/cupertino.dart';
import 'package:meu_dinheiro/app/models/home_model/brasil_model/transacao_brasil_module.dart';

//classe do dinheiro do banco do brasil(extende a reatividade nativa ChangeNotifier)
class MoneyBrasil extends ChangeNotifier {
  double _dinheiro = 4000;
  List<TransacaoBrasil> _historico  = [];

  List<TransacaoBrasil> get historico => _historico;
  double get dinheiro => _dinheiro;

  set dinheiro(double valor) {
    _dinheiro = valor;
    //ao mudar o valor ele notifica quem está escutando
    notifyListeners();
  }
  //método de manipulação
  void deposito({required double valor,required DateTime date}) {
    dinheiro += valor;
    _adicionarTransacao(TransacaoBrasil(valor: valor, data: date));
    print('depositon feito com sucesso');
  }

  void saque({required double valor,required DateTime date}) {
    dinheiro -= valor;
    _adicionarTransacao(TransacaoBrasil(valor: -valor, data: date));
    print('depositon feito com sucesso');
  }
  //especie de set do histórico
  void _adicionarTransacao(TransacaoBrasil transacao) {
    _historico.add(transacao);
    notifyListeners();
  }
}
