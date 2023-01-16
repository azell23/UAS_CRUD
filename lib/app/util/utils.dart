import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

final firebase = Firebase.initializeApp();
final firebaseAuth = FirebaseAuth.instance;
final  firebaseFireStore = FirebaseFirestore.instance;
Future<SharedPreferences> sharedPreferences() async{
  return  await SharedPreferences.getInstance();
}

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
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
