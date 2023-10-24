import 'package:flutter/cupertino.dart';
import 'package:meu_dinheiro/app/models/home_model/itau_model/transacao_itau_module.dart';

class MoneyItau extends ChangeNotifier{
  double _dinheiro = 0;
  List<TransacaoItau> _historico  = [];

  List<TransacaoItau> get historico => _historico;



  double get dinheiro => _dinheiro;

  set dinheiro(double valor) {
    _dinheiro = valor;
    notifyListeners();
  }

  void deposito({required double valor,required DateTime data}) {
    dinheiro += valor;
    _adicionarTransacao(TransacaoItau(valor: valor, data: data));
    print('depósito feito com sucesso');
  }

  void saque({required double valor,required DateTime data}) {
    dinheiro -= valor;
    _adicionarTransacao(TransacaoItau(valor: -valor, data: data));
    print('saque feito com sucesso');
  }
  void _adicionarTransacao(TransacaoItau transacao) {
    _historico.add(transacao);
    notifyListeners();
  }
}
