import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_uas/app/component/Auth.dart';
import 'package:my_uas/app/modules/makanan/controllers/makanan_controller.dart';
import 'package:my_uas/app/modules/update/controllers/update_controller.dart';
import 'package:my_uas/app/modules/update/views/update_view.dart';
import 'package:my_uas/app/routes/app_pages.dart';

class MakananView extends GetView<MakananController> {
  final authC = Get.find<Auth>();
  final update = Get.find<UpdateController>();

  @override
  Widget build(BuildContext context) {
    print("============/ ${controller.makanan.length}");
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          actions: [
            IconButton(
                onPressed: () => authC.logout(), icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.makanan.length.toInt(),
                itemBuilder: (context, index) => ListTile(
                    title: Text(controller.makanan[index].nama),
                    subtitle: Text(controller.makanan[index].harga),
                    trailing: Container(
                      width: 120,
                      height: 200,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.to(UpdateView(
                                    id: controller.makanan[index].id));
                                update.nama.text =
                                    controller.makanan[index].nama;
                                update.harga.text =
                                    controller.makanan[index].harga;
                              },
                              icon: const Icon(Icons.edit)),
                          const SizedBox(width: 10),
                          IconButton(
                              onPressed: () {
                                controller
                                    .deleteData(controller.makanan[index].id);
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    )),
              ),
            )),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () => Get.toNamed(Routes.ADD),
                child: Icon(Icons.add),
                heroTag: "FABadd",
              ),
            ),
          ]),
        ));
  }
}
