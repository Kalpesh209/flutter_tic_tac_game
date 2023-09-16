import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_game/AppUtils/app_string.dart';
import 'package:flutter_tic_tac_game/Presentation/Screens/tik_tac_screen.dart';

/*
Title: Entry Point of App
Purpose:Entry Point of App
Created On: 16/09/2023
Edited On:16/09/2023
Author: Kalpesh Khandla
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TicTacScreen(),
    );
  }
}
