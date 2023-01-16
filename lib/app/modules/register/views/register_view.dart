import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../../config/config.dart';
import '../controllers/register_controller.dart';
import 'package:my_uas/app/component/Text.dart';
import 'package:my_uas/app/component/TextFormField.dart';
import 'package:my_uas/app/routes/app_pages.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              children: [
                SizedBox(height: 100),  
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextCom("Register", 30, FontWeight.bold, Colors.black),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: TextCom(
                      "Jangan lupa bismillah",
                      15,
                      FontWeight.normal,
                      Color.fromARGB(255, 15, 15, 15)),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                TextFormFieldCom(
                    "Email",
                    "Masukan Email",
                    10,
                    !controller.isPasswordVisible.value,
                    TextInputType.emailAddress,
                    Icons.email,
                    IconButton(
                        onPressed: () {
                          controller.email.clear();
                        },
                        icon: const Icon(Icons.clear)),
                    controller.email),
                const SizedBox(height: 10),
                TextFormFieldCom(
                    "Password",
                    "Password",
                    10,
                    controller.isPasswordVisible.value,
                    TextInputType.text,
                    Icons.lock,
                    IconButton(
                        icon: Config.setVisibility(
                            controller.isPasswordVisible.value),
                        onPressed: () {
                          controller.isPasswordVisible.value =
                              !controller.isPasswordVisible.value;
                        }),
                    controller.password),
                const SizedBox(height: 10),
                TextFormFieldCom(
                    "Konfirmasi Password",
                    "Konfirmasi Password",
                    10,
                    controller.isConfirmPasswordVisible.value,
                    TextInputType.text,
                    Icons.lock,
                    IconButton(
                        icon: Config.setVisibility(
                            controller.isPasswordVisible.value),
                        onPressed: () {
                          controller.isConfirmPasswordVisible.value =
                              !controller.isConfirmPasswordVisible.value;
                        }),
                    controller.confirmPassword),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: Text("Register"),
                    onPressed: () {
                      OneShotAnimation("active", autoplay: false).isActive = true;
                      String email = controller.email.text.toString();
                      String password = controller.password.text.toString();
                      String confirm = controller.confirmPassword.text.toString();
                      if (controller.validateRegister(email, password,confirm) ==
                          "success") {
                        controller.doRegister(email, password);
                      } else {
                        Config.snackbar(
                            "Failed",
                            controller.validateRegister(email, password, confirm),
                            const Color.fromARGB(255, 250, 75, 63));
                      }
                    },
                    ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextCom("Sudah punya akun ? ", 14,
                        FontWeight.normal, Colors.black),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.LOGIN);
                      },
                      child: const TextCom(
                          "Login Disini", 14, FontWeight.normal, Colors.blue),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
