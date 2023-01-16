import 'dart:async';
import 'package:get/get.dart';
import 'package:my_uas/app/util/utils.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  void checkToken() async {
    sharedPreferences().then((value) => {
        if (value.getString("token") != null && value.getString("token")!.isNotEmpty) {
            Get.offAllNamed(Routes.MAKANAN)
          } else {
            Get.offAllNamed(Routes.LOGIN)
         }
    });
   
  }

  void timerSplashScreen(int timer) {
    Timer(Duration(seconds: timer), () => checkToken());
  }
}
