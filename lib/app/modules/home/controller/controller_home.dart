import 'package:flutter/material.dart';

class DropDownState extends ChangeNotifier {
  String _selectedValue = '';

  String get selectedValue => _selectedValue;

  set selectedValue(String value) {
    _selectedValue = value;
    notifyListeners();
  }
}
