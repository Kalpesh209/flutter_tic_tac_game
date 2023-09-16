import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_game/AppUtils/app_colors.dart';
import 'package:flutter_tic_tac_game/AppUtils/app_font_size.dart';
import 'package:flutter_tic_tac_game/AppUtils/app_string.dart';
import 'package:flutter_tic_tac_game/Presentation/Widgets/text_button_widget.dart';

/*
Title: TicTac Screen 
Purpose: To Play a Game 
Created On: 16/09/2023
Edited On:16/09/2023
Author: Kalpesh Khandla
*/

class TicTacScreen extends StatefulWidget {
  const TicTacScreen({super.key});

  @override
  State<TicTacScreen> createState() => _TicTacScreenState();
}

class _TicTacScreenState extends State<TicTacScreen> {
  bool oTurn = true;

  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayElement[index] == '') {
        displayElement[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayElement[index] == '') {
        displayElement[index] = 'X';
        filledBoxes++;
      }

      oTurn = !oTurn;
      _checkWinner();
    });
  }

  // Check for Winner

  void _checkWinner() {
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    }
    if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    }

    if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    }
    if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    }

    if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    }
    if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  // Winner Alert Dialog

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is Winner!!!"),
            actions: [
              TextButton(
                child: Text(
                  AppStrings.playAgain,
                ),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }

  // Draw Alert Dialog

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              AppStrings.draw,
            ),
            actions: [
              TextButton(
                child: Text(AppStrings.playAgain),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  // To Clear Score
  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });

    filledBoxes = 0;
  }

//  To Clear ScoreBoard

  void _clearScoreBoard() {
    setState(() {
      xScore = 0;
      oScore = 0;
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
    filledBoxes = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryAppColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            AppStrings.playerA,
                            style: TextStyle(
                              fontSize: AppFontSize.fontSize20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.colorWhite,
                            ),
                          ),
                          Text(
                            xScore.toString(),
                            style: TextStyle(
                              fontSize: AppFontSize.fontSize20,
                              color: AppColors.colorWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            AppStrings.playerB,
                            style: TextStyle(
                              fontSize: AppFontSize.fontSize20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.colorWhite,
                            ),
                          ),
                          Text(
                            oScore.toString(),
                            style: TextStyle(
                              fontSize: AppFontSize.fontSize20,
                              color: AppColors.colorWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: Text(
                            displayElement[index],
                            style: TextStyle(
                              color: AppColors.colorWhite,
                              fontSize: AppFontSize.fontSize34,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButtonWidget(
                    btnTxt: AppStrings.clearScore,
                    onBtnTap: () {
                      _clearScoreBoard();
                    },
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
