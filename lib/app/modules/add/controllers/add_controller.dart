import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_uas/app/routes/app_pages.dart';
import '../../../util/utils.dart';

class AddController extends GetxController {
  TextEditingController nama = TextEditingController();
  TextEditingController harga = TextEditingController();

final  firebaseFireStore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;
  
  @override
  void onInit() {
    collectionReference = firebaseFireStore.collection('makanan');
    super.onInit();
  }

  

  void postData(
      String nama, String harga) {
        collectionReference.add({
          'nama': nama,
          'harga': harga
        }).whenComplete((){
          Config.snackbar("Success", "Tambah Data", Colors.green);
          print("Suksses");
          Get.offAllNamed(Routes.MAKANAN);
        }).catchError((e) => print("error $e"));
      }
      
}
