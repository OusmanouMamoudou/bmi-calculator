import 'package:bmi/calculator_brain.dart'; // Import the calculator_brain.dart file for the BMI calculation logic.
import 'package:bmi/const.dart'; // Import a file (const.dart) for constants.
import 'package:bmi/my_widgets/my_bottom_bar.dart'; // Import a custom widget for the bottom bar.
import 'package:bmi/my_widgets/my_container.dart'; // Import a custom widget for the container.
import 'package:bmi/my_widgets/my_icon_button.dart'; // Import a custom widget for icon buttons.
import 'package:bmi/my_widgets/my_icon_child.dart'; // Import a custom widget for icon child.
import 'package:bmi/screens/result_page.dart'; // Import the result_page.dart file for displaying results.
import 'package:flutter/material.dart'; // Import the Flutter material package.
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Import the Font Awesome Flutter package for icons.

class Bmi extends StatefulWidget {
  // Define a StatefulWidget class for the main BMI screen.
  const Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState(); // Create a state for the Bmi class.
}

class _BmiState extends State<Bmi> {
  // Define the state for the Bmi class.
  Gender? selectedGender; // Enum for selected gender.
  int height = 180; // Initial height value.
  int weight = 60; // Initial weight value.
  int age = 19; // Initial age value.

  @override
  Widget build(BuildContext context) {
    // Build method to define the appearance of the BMI screen.
    return Scaffold(
        // Scaffold widget for the basic material design structure.
        appBar: AppBar(
          // AppBar for the top bar of the screen.
          title: const Text("CALCULATOR IMC"), // Set the title of the app.
          centerTitle: true, // Center-align the title.
        ),
        body: Column(
          // Column to arrange child widgets vertically.
          crossAxisAlignment:
              CrossAxisAlignment.stretch, // Stretch widgets horizontally.
          children: [
            Expanded(
              // Expanded widget to take available space equally.
              child: Row(
                // Row to arrange widgets horizontally.
                children: [
                  Expanded(
                    child: MyContainer(
                      // Custom container for the male icon.
                      function: () {
                        setState(() {
                          selectedGender = Gender
                              .male; // Mise à jour de selectedGender pour  homme
                        });
                      },
                      color: selectedGender == Gender.male
                          ? kActiveContainerColor
                          : kInactiveContainerColor,
                      containerChild: const MyIconChild(
                        text: 'HOMME',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      // Custom container for the female icon.
                      function: () {
                        setState(() {
                          selectedGender = Gender
                              .female; // Mise à jour de selectedGender pour femme
                        });
                      },
                      color: selectedGender == Gender.female
                          ? kActiveContainerColor
                          : kInactiveContainerColor,
                      containerChild: const MyIconChild(
                          text: 'FEMME', icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: MyContainer(
              // Custom container for the height slider.
              color: kActiveContainerColor,
              containerChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HAUTER',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kLabel1Style),
                        const Text(
                          'cm',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15,
                          ),
                          overlayShape:
                              const RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: const Color(0xFF8D8E98),
                        onChanged: (double sliderValue) {
                          setState(() {
                            height = sliderValue
                                .round(); // height prend la valeur du slider arrondi grace à la foction round()
                          });
                        },
                      ),
                    )
                  ]),
            )),
            Expanded(
              // Expanded widget to take available space equally.
              child: Row(
                // Row to arrange widgets horizontally.
                children: [
                  Expanded(
                      child: MyContainer(
                    // Custom container for the weight details.
                    color: kActiveContainerColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("POIDS", style: kLabelStyle),
                        Text(weight.toString(), style: kLabel1Style),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIconButton(
                                // Custom icon button for increasing weight.
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    weight++; // le poids est ajouté de 1 à chaque clique
                                  });
                                }),
                            const SizedBox(width: 10),
                            MyIconButton(
                                // Custom icon button for decreasing weight.
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    if (weight > 60) {
                                      weight--; // le poids est diminué de 1 à chaque clique
                                    }
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: MyContainer(
                    // Custom container for the age details.
                    color: kActiveContainerColor,
                    containerChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE", style: kLabelStyle),
                        Text(age.toString(), style: kLabel1Style),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyIconButton(
                                // Custom icon button for increasing age.
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    if (age > 80) {
                                      // si l'age est supérieur à 80, il prend la valeur 19
                                      age = 19;
                                    }
                                    age++;
                                  });
                                }),
                            const SizedBox(width: 10),
                            MyIconButton(
                                // Custom icon button for decreasing age.
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    if (age <= 16) {
                                      // si l'age est inferieur à 16, il prend la valeur 19
                                      age = 19;
                                    }
                                    age--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            MyBottomBar(
              // Custom bottom bar for the 'CALCULATE' button.
              text: 'CALCULEZ',
              function: () {
                // On utilise la classe CalculatorBrain pour le calcul et l'affiche des mots
                // Pour envoyer à la prochaine écran
                CalculatorBrain calBrain =
                    CalculatorBrain(weight: weight, height: height);
                String resultCal = calBrain.getCalculateBmi();
                String resultText = calBrain.getResult();
                String interpretation = calBrain.getInterpretation();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Results(
                        resultCal: resultCal,
                        resultText: resultText,
                        interpretation: interpretation,
                      ),
                    ));
              },
            ),
          ],
        ));
  }
}

enum Gender { female, male } // Enum for gender selection.
