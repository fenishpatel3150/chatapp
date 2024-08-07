import 'package:chatapp/view/Home/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController textemail = TextEditingController();
  TextEditingController textpassword = TextEditingController();
  TextEditingController textconfimpassword = TextEditingController();
  RxBool validationComplete = false.obs;
  RxBool validationConfirm = false.obs;

  void validation() {
    validationComplete.value = !validationComplete.value;
  }
  void confirmValidation() {
    validationConfirm.value = !validationConfirm.value;
  }

  Future<void> login() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: textemail.text,
        password: textpassword.text,
      );
      Get.to(() => HomeScreen());
    } catch (e) {

    }
  }
  Future<void> Signup() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: textemail.text,
        password: textpassword.text,
      );
      Get.to(() => HomeScreen());
    } catch (e) {

    }
  }
}
