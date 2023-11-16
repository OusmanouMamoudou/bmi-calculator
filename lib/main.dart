import 'package:bmi/screens/bmi.dart'; // Importe la classe Bmi du fichier bmi.dart.
import 'package:flutter/material.dart'; // Importe le package de matériel Flutter.

void main() {
  runApp(
      const MyApp()); // Point d'entrée de l'application, appel de runApp pour exécuter l'application.
}

// This code sets up a Flutter application with a dark theme and a custom home screen
//represented by the Bmi class.
//The app title is set to 'Bmi',
//and the debug banner is disabled in development mode.

class MyApp extends StatelessWidget {
  // Définit une classe MyApp qui étend StatelessWidget, indiquant que c'est un widget immuable.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // La méthode build qui définit l'apparence de l'application.
    return MaterialApp(
      // Retourne un widget MaterialApp, qui est le widget racine de l'application.
      debugShowCheckedModeBanner:
          false, // Désactive l'affichage de la bannière de débogage en mode développement.
      title: 'Bmi', // Définit le titre de l'application.
      theme: ThemeData.dark().copyWith(
        // Définit le thème sombre de l'application avec quelques personnalisations.
        appBarTheme: const AppBarTheme(
          // Personnalise le thème de la barre d'applications.
          backgroundColor: Color(
              0xFF0A0D22), // Définit la couleur de fond de la barre d'applications.
        ),
        scaffoldBackgroundColor: const Color(
            0xFF0A0D22), // Définit la couleur de fond de l'échafaudage.
      ),
      home:
          const Bmi(), // Définit l'écran d'accueil de l'application comme une instance de la classe Bmi.
    );
  }
}
