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
                      Get.toNamed(Routes.MAKANAN),
                      addToken(value.user!.uid),
                      sharedPreferences().then((values) => values.setString("name", value.user!.email!
                                  .replaceFirst("@gmail.com", ""))),
                      sharedPreferences().then((values) => values.setString("email", value.user!.email!)),
                      Config.snackbar(
                          "Success Login",
                          "Hallo ${value.user!.email!.replaceFirst("@gmail.com", "")}",
                          const Color.fromARGB(255, 102, 253, 107))
                    }
                  else
                    {
                      Config.snackbar(
                          "Failed", "Email is not verified", Colors.red)
                    }
                }
              else
                {Config.snackbar("Failed", "User is null", Colors.red)}
            });
  }

  void addToken(String token) async {
    sharedPreferences().then((sp) => sp.setString("token", token));
  }
}

