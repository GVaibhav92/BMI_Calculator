import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight,required this.gender});

  final int height;
  final int weight;
  final String gender;
  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (gender == 'male') {
      if (_bmi >= 30) {
        return 'Obese';
      } else if (_bmi >= 25) {
        return 'Overweight';
      } else if (_bmi >= 18.5) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    } else {
      // female ranges (slightly lower thresholds)
      if (_bmi >= 29) {
        return 'Obese';
      } else if (_bmi >= 24) {
        return 'Overweight';
      } else if (_bmi >= 18) {
        return 'Normal';
      } else {
        return 'Underweight';
      }
    }
  }

  String getInterpretation() {
    if (gender == 'male') {
      if (_bmi >= 30) {
        return 'As a male, your BMI is in the obese range. Consider consulting a doctor or nutritionist.';
      } else if (_bmi >= 25) {
        return 'You are overweight for a male. Regular exercise and a healthy diet could help.';
      } else if (_bmi >= 18.5) {
        return 'You have a normal body weight. Great job maintaining your health!';
      } else {
        return 'You are underweight. You might want to consult a nutritionist.';
      }
    } else {
      if (_bmi >= 29) {
        return 'As a female, your BMI is in the obese range. Seek medical or dietary guidance if needed.';
      } else if (_bmi >= 24) {
        return 'You are slightly overweight for a female. Consider healthy lifestyle choices.';
      } else if (_bmi >= 18) {
        return 'You have a healthy body weight for a female. Keep it up!';
      } else {
        return 'You are underweight. A health check or diet change could help.';
      }
    }
  }
}
