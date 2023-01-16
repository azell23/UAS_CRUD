

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddDataView'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: Center(
          child: Column(children: [
            TextField(
              controller: controller.nama,
              decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,
                  labelText: "Nama Makanan",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: "Masukan nama makanan"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.harga,
              decoration: InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,
                  labelText: "Harga",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: "Masukan Harga Makanan"),
            ),
          
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  String nama = controller.nama.text.toString();
                  String harga = controller.harga.text.toString();
                 
                  controller.postData(nama, harga);
                  print("$nama, $harga");
                },
                child: Text("Tambah Data"))
          ]),
        ),
      ),
    );
  }
}
