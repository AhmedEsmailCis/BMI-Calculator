import 'dart:math';

class BmiBrain {
  int height;
  int weight;
  double _bmi;
  BmiBrain(this.height, this.weight);
  String getBmiResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBmiText() {
    if (_bmi >= 25)
      return "Over Weight";
    else if (_bmi > 18.5)
      return "Normal";
    else
      return "Under Weight";
  }

  String getInterpretation() {
    if (_bmi >= 25)
      return "you have a higher than normal weight , try to  exercise more .";
    else if (_bmi > 18.5)
      return "you have a normal body weight , Good job .";
    else
      return "you have a lower than normal weight , try to  eat a bit more .";
  }
}
