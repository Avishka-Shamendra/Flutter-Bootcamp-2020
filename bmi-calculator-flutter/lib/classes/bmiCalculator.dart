import 'dart:math';

class BmiCalculator {
  BmiCalculator({this.height, this.weight});
  int height;
  int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / (pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResultHeader() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 19) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getDescription() {
    if (_bmi > 25) {
      return 'Hey please do some exrecises';
    } else if (_bmi > 19) {
      return 'Looks good boy';
    } else {
      return 'Start eating.Food is awesome';
    }
  }
}
