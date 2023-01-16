import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Config {
  static Widget setVisibility(bool icon) {
    return Icon(icon ? Icons.visibility : Icons.visibility_off);
  }

  static SnackbarController snackbar(
      String tittle, String subTittle, Color color) {
    return Get.snackbar(tittle, subTittle,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(30),
        backgroundColor: color);
  }

  static LinearGradient gradientColor(Color firstColor, Color secondColor) {
    return LinearGradient(
        colors: [firstColor, secondColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
  }

  static AnimatedPositioned animatedPositioned(double widths) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      width: widths,
      height: 56,
      left: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 36, 154, 250),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

}