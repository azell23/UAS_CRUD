import 'package:flutter/material.dart';
import 'package:my_uas/app/component/Text.dart';
import 'package:my_uas/app/component/TextFormField.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import '../../../config/config.dart';
import '../controllers/login_controller.dart';
import 'package:my_uas/app/routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  void initState() {
    controller.isPasswordVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            child: Column(
              children: [    
                SizedBox(height: 100),            
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    width: 130,
                    child: const TextCom(
                        "Bismillah", 30, FontWeight.bold, Colors.black),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 350,
                    child: const TextCom(
                        "Masukan email dan password, Register jika belum punya akun",
                        15,
                        FontWeight.normal,
                        Colors.black),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormFieldCom(
                    "Email",
                    "Masukan Email",
                    8,
                    !controller.isPasswordVisible.value,
                    TextInputType.multiline,
                    Icons.email,
                    IconButton(
                        onPressed: () {
                          controller.email.clear();
                        },
                        icon: const Icon(Icons.clear)),
                    controller.email),
                const SizedBox(height: 10),
                Obx(() => TextFormFieldCom(
                    "Password",
                    "Masukan Password",
                    8,
                    controller.isPasswordVisible.value,
                    TextInputType.multiline,
                    Icons.lock,
                    IconButton(
                        icon: Config.setVisibility(
                            controller.isPasswordVisible.value),
                        onPressed: () {
                          controller.isPasswordVisible.value =
                              !controller.isPasswordVisible.value;
                        }),
                    controller.password)),
                const SizedBox(height: 10),
                ElevatedButton(
                  child: Text("Login"),
                    onPressed: () {
                      OneShotAnimation("active", autoplay: false).isActive = true;
                      String email = controller.email.text.toString();
                      String password = controller.password.text.toString();
                      if (controller.validateLogin(email, password) ==
                          "success") {
                        controller.doLogin(email, password);
                      } else {
                        Config.snackbar(
                            "Failed",
                            controller.validateLogin(email, password),
                            const Color.fromARGB(255, 250, 75, 63));
                      }
                    },
                    ),
                const SizedBox(height: 30),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const TextCom("Tidak punya akun ? ", 14,
                        FontWeight.normal, Colors.black),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: const TextCom(
                          "Daftar Disini", 14, FontWeight.normal, Colors.blue),
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