import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tic_tac_game/AppUtils/app_colors.dart';
import 'package:flutter_tic_tac_game/AppUtils/app_font_weight.dart';

/*
Title: AppUtilities
Purpose:AppUtilities used through App
Created On: 16/09/2023
Edited On:16/09/2023
Author: Kalpesh Khandla
*/

class AppUtilities {
  BuildContext context;
  AppUtilities(
    this.context,
  );

  // To Dismiss Keyboard
  void dismissKeyboard() => FocusScope.of(context).unfocus();
  // To Show SnackBar
  void showTextSnackBar(String text) {
    var textWidget = Text(
      text,
      style: TextStyle(
        fontSize: 15.h,
        fontWeight: AppFontWeight.fontWeight700,
      ),
    );
    var snackBar = SnackBar(
      content: textWidget,
      backgroundColor: AppColors.primaryAppColor,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
