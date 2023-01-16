import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_uas/app/routes/app_pages.dart';

class UpdateController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();
  late CollectionReference collectionReference;

  Rx<String> nameu = ''.obs;
  Rx<String> hargau = ''.obs;
  final data = Get.arguments;

  @override
  void onInit() {
    collectionReference = FirebaseFirestore.instance.collection('makanan');
    nama.addListener(() {
      nameu.value = nama.text;
    });
    harga.addListener(() {
      hargau.value = harga.text;
    });
    super.onInit();
  }

  

   void updateData(String id, String nama, String harga) {
    collectionReference.doc(id).update({
      'nama': nama,
      'harga': harga
    }).whenComplete(() {
      Get.offAllNamed(Routes.MAKANAN);
      print("Sukses");
    });
  }
}