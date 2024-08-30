import 'package:chatapp/controller/LoginController/LoginController.dart';
import 'package:chatapp/helper/LoginService/FireStorageService.dart';
import 'package:chatapp/helper/LoginService/Google_Sign_In_service.dart';
import 'package:chatapp/model/userModel.dart';
import 'package:chatapp/view/Home/HomeScreen.dart';
import 'package:chatapp/view/Login/Signup/SignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> logindata = GlobalKey<FormState>();
     LoginController loginController = Get.find();

    return Scaffold(
      backgroundColor: const Color(0xff18171f),
      appBar: AppBar(
        backgroundColor: const Color(0xff18171f),
        leading: IconButton(
          onPressed: () {
            Get.toNamed('/intro');
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: logindata,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey,',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp),
                    ),
                    Text(
                      'Welcome',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp),
                    ),
                    Text(
                      'Back',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Container(
                  width: 330.w,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: loginController.textemail,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: 'Enter your Email Id',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(Icons.email, color: Colors.grey),
                      ),
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      bool emailValidation = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);

                      if (value.isEmpty) {
                        return "Enter Email";
                      } else if (!emailValidation) {
                        return "Enter Valid Email";
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Container(
                  width: 330.w,
                  child: Obx(
                    () => TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: loginController.textpassword,
                      obscureText: !loginController.validationComplete.value,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Enter your Password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.lock, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              loginController.validation();
                            },
                            child: Icon(
                              loginController.validationComplete.value
                                  ? CupertinoIcons.eye_solid
                                  : CupertinoIcons.eye_slash,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (value.length < 6) {
                          return "Password length should be more than 6 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () async {
                  if (logindata.currentState!.validate()) {
                    await loginController.login();
                    UserModel userModal = UserModel(
                        name: 'fenish',
                        phone: '7846532122',
                        email: loginController.textemail.text,
                        photourl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOuxrvcNMfGLh73uKP1QqYpKoCB0JLXiBMvA&s');

                    UserService.userService.addUser(userModal);
                    loginController.textemail.clear();
                    loginController.textpassword.clear();
                  }
                },
                child: Container(
                  height: 50.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Log In',
                      style: GoogleFonts.lato(
                          color: const Color(0xff18171f),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'or continue with',
                style: GoogleFonts.lato(color: Colors.white),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {

                  String status = await GoogleSignInService.googleSignInSarvice
                      .signInWithGoogle();

                  if (status == 'Suceess') {
                    User? user =
                        GoogleSignInService.googleSignInSarvice.currentUser();

                    if(user!=null)
                      {
                        UserModel userModal = UserModel(
                            name: user.displayName,
                            phone: user.phoneNumber ?? '7846532122',
                            email: user.email,
                            photourl: user.photoURL);

                        Get.toNamed("/home");
                        UserService.userService.addUser(userModal);

                      }
                  }
                },
                child: Container(
                  height: 50.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/login/image2.png', height: 40.sp),
                        const SizedBox(width: 10),
                         Text(
                          'Google',
                          style: TextStyle(color: Colors.white,
                              fontSize: 20.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/signup');
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
