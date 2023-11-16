import 'package:bmi/const.dart'; // Import the constants from the const.dart file.
import 'package:bmi/my_widgets/my_bottom_bar.dart'; // Import the custom bottom bar widget.
import 'package:flutter/material.dart'; // Import the Flutter material package.

import '../my_widgets/my_container.dart'; // Import the custom container widget.

//Ce code Dart représente l'écran de résultats d'une application de calcul
//de l'IMC en Flutter. Il affiche le résultat de l'IMC calculé, la catégorie
// et une interprétation. L'écran comprend un conteneur personnalisé et
//une barre inférieure avec une option de recalcul.

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.resultCal,
    required this.resultText,
    required this.interpretation,
  });

  final String resultCal; // BMI result value.
  final String resultText; // BMI result category (e.g., overweight, normal).
  final String interpretation; // Interpretation of the BMI result.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULATEUR IMC'), // Set the app bar title.
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Vos resultats', // Display the results label.
            style: kLabel1Style, // Apply the larger label text style.
          ),
        ),
        Expanded(
          child: MyContainer(
            color: kActiveContainerColor, // Set the container color.
            containerChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText,
                      style: kResultStyle), // Display the BMI result category.
                  Text(resultCal,
                      style: kResultNStyle), // Display the BMI result value.
                  Text(interpretation,
                      textAlign: TextAlign.center,
                      style:
                          kResultTextStyle), // Display the interpretation of the BMI result.
                ]),
          ),
        ),
        MyBottomBar(
          text: 'RE-CALCULEZ', // Set the text for the bottom bar button.
          function: () {
            Navigator.pop(context); // Navigate back to the previous screen.
          },
        ),
      ]),
    );
  }
}
