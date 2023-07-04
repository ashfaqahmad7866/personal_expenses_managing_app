import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/widgets/expenses.dart';
//import'package:flutter/services.dart';
var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kDarkColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 99, 125));
void main() {
  WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) {
// //add runApp() whole code here
//   });
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.onPrimaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
                elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            //backgroundColor: kColorScheme.onTertiaryContainer
            foregroundColor:kDarkColorScheme.primaryContainer,
            backgroundColor:kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            // backgroundColor: kColorScheme.primaryContainer,
            // foregroundColor: kColorScheme.primaryContainer
            ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            //backgroundColor: kColorScheme.onTertiaryContainer
            foregroundColor: Colors.black,
            backgroundColor: const Color.fromARGB(255, 248, 249, 250),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 17),
            ),
      ),
      home: const Expenses(),
      themeMode: ThemeMode.system,
    ),
  );
}
