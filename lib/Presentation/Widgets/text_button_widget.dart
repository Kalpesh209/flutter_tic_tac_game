import 'package:flutter/material.dart';
import 'package:flutter_tic_tac_game/AppUtils/app_colors.dart';
import 'package:flutter_tic_tac_game/AppUtils/app_font_size.dart';

/*
Title: TextButtonWidget used thorough App
Purpose:TextButtonWidget used thorough App
Created On: 16/09/2023
Edited On:16/09/2023
Author: Kalpesh Khandla
*/

class TextButtonWidget extends StatefulWidget {
  final String btnTxt;
  final Function() onBtnTap;
  const TextButtonWidget({
    super.key,
    required this.btnTxt,
    required this.onBtnTap,
  });

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        widget.onBtnTap();
      },
      child: Text(
        widget.btnTxt,
        style: TextStyle(
          fontSize: AppFontSize.fontSize20,
          fontWeight: FontWeight.bold,
          color: AppColors.colorWhite,
        ),
      ),
    );
  }
}
