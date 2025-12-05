import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  double hasil = 0;

  void hitung(double a, double b, String op) {
    switch (op) {
      case '+':
        hasil = a + b;
        break;
      case '-':
        hasil = a - b;
        break;
      case '×':
        hasil = a * b;
        break;
      case '÷':
        hasil = b == 0 ? 0 : a / b;
        break;
    }
    notifyListeners();
  }
}
