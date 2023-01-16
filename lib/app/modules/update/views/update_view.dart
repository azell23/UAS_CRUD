import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_uas/app/modules/update/controllers/update_controller.dart';


class UpdateView extends GetView<UpdateController> {
 
 final String? id;
  

  const UpdateView(
      {Key? key,required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateDataView'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
             TextField(
              controller: controller.nama,
              decoration: const InputDecoration(
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,
                  labelText: "Nama Makanan",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  hintText: "Masukan Nama Makanan"),
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
                  hintText: "Masukan Harga"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: (){
                  String nama = controller.nama.text.toString();
                  String harga = controller.harga.text.toString();
                  if(id != null){
                    controller.updateData(this.id.toString(),nama, harga);
                  }else{
                    print("null id");
                  }
                  
                },
                child: Text(
                  "Update Data",
                ))
          ]),
        ),
      ),
    );
  }
}