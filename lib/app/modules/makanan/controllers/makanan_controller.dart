import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:my_uas/app/routes/app_pages.dart';
import '../../../model/Makanan.dart';

class MakananController extends GetxController {
  RxList<Makanan> makanan = RxList<Makanan>([]);
  final firebaseFireStore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  @override
  void onInit() {
    collectionReference = firebaseFireStore.collection('makanan');
    makanan.bindStream(readData());
    super.onInit();
  }


  Stream<List<Makanan>> readData() {
    return collectionReference.snapshots().map((datas) => datas.docs
        .map((motor) => Makanan.fromMap(documentSnapshot: motor))
        .toList());
  }

    void deleteData(String? id) {
    collectionReference.doc(id).delete().whenComplete(() {
      print("Sukses Hapus");
      Get.offAllNamed(Routes.MAKANAN);
    });
  }



}
