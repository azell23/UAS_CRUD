import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_uas/app/util/utils.dart';

class RegisterController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isConfirmPasswordVisible = true.obs;

  String validateRegister(String email, String pw1, String pw2) {
    String result = "";
    if (email.isNotEmpty && pw1.isNotEmpty && pw2.isNotEmpty) {
      if (email.contains("@")) {
        if (pw1 == pw2) {
          result = "success";
        } else {
          result = "Password is not same, check again";
        }
      } else {
        result = "Please enter a valid email";
      }
    }
    return result;
  }

  void clearEditText() {
    email.clear();
    password.clear();
    confirmPassword.clear();
  }

  Future<void> registerWithEmailPassword(String email, String password) async {
    try {
      final register = firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await register.then((value) => {
            if (value.user != null)
              {
                value.user!.sendEmailVerification(),
                Config.snackbar(
                    "Register Successfully",
                    "Please Check your email to activate your account",
                    Color.fromARGB(255, 18, 48, 214))
              }
            else
              {
                Config.snackbar(
                    "Failed", "Something wrong from your email", Color.fromARGB(255, 247, 42, 27))
              }
          });
    } catch (e) {
      print("${e.toString()}");
    }
  }

  void doRegister(String email, String password) {
    registerWithEmailPassword(email, password);
    clearEditText();
  }
}
