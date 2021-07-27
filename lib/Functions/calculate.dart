import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  Calculator(this.height, this.weight);
  double? _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25.0) {
      return 'Overweight';
    } else if (_bmi! > 18.0) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getToString() {
    if (_bmi! >= 25.0) {
      return 'You have a higher than normal \n body weight. Try to exercise more.';
    } else if (_bmi! > 18.0) {
      return 'You have a normal body weight. Good job';
    } else {
      return 'You have a lower than normal \n body weight. You can eat a little bit more.';
    }
  }
}
