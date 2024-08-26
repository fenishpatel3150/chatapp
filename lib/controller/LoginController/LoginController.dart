import 'package:chatapp/view/Home/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../helper/LoginService/Google_Sign_In_service.dart';

class LoginController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController textemail = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController textpassword = TextEditingController();
  TextEditingController textconfimpassword = TextEditingController();
  RxBool validationComplete = false.obs;
  RxBool validationConfirm = false.obs;
  RxString email = "".obs;
  RxString name = "".obs;
  RxString url = "".obs;
  RxString receiverEmail ="".obs;
  RxString receiverName ="".obs;

  void validation() {
    validationComplete.value = !validationComplete.value;
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

  void confirmValidation() {
    validationConfirm.value = !validationConfirm.value;
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

  void getRecevier(String email,String name)
  {
       receiverEmail.value =email;
       receiverName.value =name;
  }
  void getUserDetail() {
    User? user = GoogleSignInService.googleSignInSarvice.currentUser();
    if (user != null) {
      email.value = user.email!;
      url.value = user.photoURL!;
      name.value = user.displayName!;
    }
  }
}