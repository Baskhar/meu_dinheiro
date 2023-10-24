import 'package:flutter/cupertino.dart';

class TransacaoItau extends ChangeNotifier {
  final double valor;
  final DateTime data;

  TransacaoItau({required this.valor, required this.data});
}