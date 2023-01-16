import 'package:get/get.dart';
import 'package:my_uas/app/modules/update/controllers/update_controller.dart';

import '../controllers/makanan_controller.dart';

class MakananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MakananController>(
      () => MakananController(),
    );
    Get.lazyPut<UpdateController>(
      () => UpdateController(),
    );
  }
}
