import 'package:flutter/material.dart';
import 'package:sang/res/constants/app_colors.dart';

class Utils{
  static void showCustomSnackBar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: AppColors.kBlack,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          content,
          style: const TextStyle(
              color: Colors.white, fontSize: 12.0, fontFamily: "Inter"),
        ),
      ),
      action: SnackBarAction(
        label: 'Close',
        textColor: Colors.black,
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}