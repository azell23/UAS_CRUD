import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_uas/app/util/utils.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isPasswordVisible = true.obs;
  RxBool isClick = false.obs;

  String validateLogin(String email, String password) {
    String result = "";
    if (email.isNotEmpty && password.isNotEmpty) {
      if (email.contains("@")) {
        result = "success";
      } else {
        result = "Email is not valid";
      }
    } else {
      result = "Column cannot be empety";
    }
    return result;
  }

  Future<void> doLogin(String email, String password) async {
    firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              if (value.user != null)
                {
                  if (value.user!.emailVerified)
                    {
                      Get.offAllNamed(Routes.MAKANAN),
                      addToken(value.user!.uid),
                      sharedPreferences().then((values) => values.setString("name", value.user!.email!
                                  .replaceFirst("@gmail.com", ""))),
                      sharedPreferences().then((values) => values.setString("email", value.user!.email!)),
                      Config.snackbar(
                          "Success Login",
                          "Hallo ${value.user!.email!.replaceFirst("@gmail.com", "")}",
                          Color.fromARGB(255, 13, 102, 218))
                    }
                  else
                    {
                      Config.snackbar(
                          "Failed", "Email is not verified", Color.fromARGB(255, 219, 31, 18))
                    }
                }
              else
                {Config.snackbar("Failed", "User is null", Color.fromARGB(255, 218, 34, 20))}
            });
  }

  void addToken(String token) async {
    sharedPreferences().then((sp) => sp.setString("token", token));
  }
}

