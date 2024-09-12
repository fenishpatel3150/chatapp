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
                padding:  EdgeInsets.only(right: 150.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey,',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp),
                    ),
                    Text(
                      'Welcome\nBack',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.sp),
                    ),

                  ],
                ),
              ),
               SizedBox(height: 50.h),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(left: 10.h,right: 10.h),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: loginController.textemail,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      hintText: 'Enter your Email Id',
                      prefixIcon:  Padding(
                        padding: EdgeInsets.only(left: 10.h),
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
               SizedBox(height: 15.h),
              Center(
                child: Padding(
                  padding:  EdgeInsets.only(left: 10.h,right: 10.h),
                  child: Obx(
                    () => TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: loginController.textpassword,
                      obscureText: !loginController.validationComplete.value,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        hintText: 'Enter your Password',
                        prefixIcon:  Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: const Icon(Icons.lock, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffix: Padding(
                          padding:  EdgeInsets.only(right: 20.h),
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
               SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(right: 20.h),
                    child: Text(
                      'Forget Password?',
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ),
                ],
              ),
               SizedBox(height: 30.h),
              InkWell(
                onTap: () async {
                  if (logindata.currentState!.validate()) {
                    await loginController.login();
                    UserModel userModal = UserModel(
                        name: 'fenish',
                        phone: '7846532122',
                        email: loginController.textemail.text,
                        photourl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOuxrvcNMfGLh73uKP1QqYpKoCB0JLXiBMvA&s');

                    UserService.userService.addUser(userModal);
                    loginController.textemail.clear();
                    loginController.textpassword.clear();
                    UserService.userService.updateUserToken();
                  }
                },
                child: Padding(
                  padding:  EdgeInsets.only(left: 10.h,right: 10.h),
                  child: Container(
                    height: 50.h,
                    width: 330.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
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
              ),
               SizedBox(height: 20.h),
              Text(
                'or continue with',
                style: GoogleFonts.lato(color: Colors.white),
              ),
              SizedBox(height: 20.h),
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
                        UserService.userService.updateUserToken();
                      }
                  }
                },
                child: Padding(
                  padding:  EdgeInsets.only(left: 10.h,right: 10.h),
                  child: Container(
                    height: 50.h,
                    width: 330.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/login/image2.png', height: 40.sp),
                           SizedBox(width: 10.h),
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
              ),
               SizedBox(height: 10.h),
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
