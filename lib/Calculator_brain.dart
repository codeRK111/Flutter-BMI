import 'dart:math';

class CalculatorBrain {
  int weight;
  int height;
  double _bmi;
  CalculatorBrain({this.weight, this.height});

  String getResult() {
    _bmi = weight / pow(height / 100, 2);
    return "test";
  }
}
