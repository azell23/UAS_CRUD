import 'package:cloud_firestore/cloud_firestore.dart';

class Makanan {
  String? id;
  late String nama;
  late String harga;

  Makanan({
    required this.id,
    required this.nama,
    required this.harga
  });


  Makanan.fromMap({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    nama = documentSnapshot["nama"];
    harga = documentSnapshot["harga"];
  }
}
