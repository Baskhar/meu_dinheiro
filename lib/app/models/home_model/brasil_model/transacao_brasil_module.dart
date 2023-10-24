import 'package:flutter/cupertino.dart';


//classe que modela os dados de transação
class TransacaoBrasil extends ChangeNotifier {
  final double valor;
  final DateTime data;

  TransacaoBrasil({required this.valor, required this.data});
}