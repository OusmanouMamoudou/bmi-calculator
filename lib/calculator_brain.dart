import 'dart:math'; // importation du math pour utiliser la fonction pow()

//This Dart class represents the core logic of a BMI calculator.
//It calculates BMI based on weight and height,
//provides a result category (underweight, normal, overweight),
//and gives an interpretation message based on the calculated BMI.

class CalculatorBrain {
  final int weight; // Weight of the person.
  final int height; // Height of the person.

  CalculatorBrain(
      {required this.weight,
      required this.height}); // Constructor with required parameters.

  double? _bmi; // BMI value, initially null.

  String getCalculateBmi() {
    _bmi = weight /
        pow(height / 100, 2); // Calculate BMI using weight (kg) and height (m).
    return _bmi!
        .toStringAsFixed(1); // Return BMI as a string with one decimal place.
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'OVERWEIGHT'; // If BMI is greater than or equal to 25, return 'OVERWEIGHT'.
    } else if (_bmi! >= 18.5) {
      return 'NORMAL'; // If BMI is between 18.5 and 25, return 'NORMAL'.
    } else {
      return 'UNDERWEIGHT'; // If BMI is less than 18.5, return 'UNDERWEIGHT'.
    }
  }

  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have higher than normal body weight. Try to exercise more'; // Interpretation for overweight.
    } else if (_bmi! >= 18.5) {
      return 'You have a normal body weight. Good Job'; // Interpretation for normal weight.
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more'; // Interpretation for underweight.
    }
  }
}
