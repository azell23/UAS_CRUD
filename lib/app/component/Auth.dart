import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_uas/app/routes/app_pages.dart';

import '../util/utils.dart';

class Auth extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Config.snackbar("Selamat Datang", "Selamat Datang", Color.fromARGB(255, 42, 158, 46));
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Config.snackbar(
            "user tidak ditemukan","user not found", Color.fromARGB(255, 245, 39, 25));
        print("no user for that email");
      } else if (e.code == 'wrong-password') {
        Config.snackbar(
            "password salah", "password salah", Color.fromARGB(255, 240, 46, 33));
        print("password salah");
      }
    }
  }

  void signup(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Get.offAllNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Config.snackbar(
            "Password salah", "The password is to weak", Colors.red);
        print("The password is to weak");
      } else if (e.code == 'email-already-in-use') {
         Config.snackbar(
            "Email sudah digunakan", "The account already exists fot that email", Colors.red);
        print('Email sudah digunakan');
      }
    } catch (e) {
      print(e);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Config.snackbar("Bye", "Sampai Jumpa Kembali", Colors.green);
    print("Suksses");
    Get.offAllNamed(Routes.LOGIN);
  }
}
