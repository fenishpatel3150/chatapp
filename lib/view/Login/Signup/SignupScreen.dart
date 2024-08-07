import 'package:chatapp/controller/LoginController/LoginController.dart';
import 'package:chatapp/view/Home/HomeScreen.dart';
import 'package:chatapp/view/Login/LoginScreen/LoginPage.dart';
import 'package:chatapp/view/Login/Signup/SignupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> logindata = GlobalKey<FormState>();
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xff18171f),
      appBar: AppBar(
        backgroundColor: const Color(0xff18171f),
        leading: IconButton(
          onPressed: () {
            Get.back();
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
                      "Let's get",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    Text(
                      'started',
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ],
                ),
              ),
               SizedBox(height: 50),
              Center(
                child: Container(
                  width: 350,
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
                      hintText: 'Email Id',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10,),
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
                  width: 350,
                  child: Obx(
                        () => TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: loginController.textpassword,
                      obscureText:
                      !loginController.validationComplete.value,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.lock, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffix: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              loginController.togglePasswordVisibility();
                            },
                            child: Icon(
                              loginController.validationComplete.value
                                  ? CupertinoIcons.eye_solid
                                  : CupertinoIcons.eye_slash,
                              color: Colors.white,
                              size: 20,
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
              Center(
                child: Container(
                  width: 350,
                  child: Obx(
                        () => TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: loginController.textconfimpassword,
                      obscureText:
                      !loginController.validationComplete.value,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Confirm Password',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Icon(Icons.lock, color: Colors.grey),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey),
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

              const SizedBox(height: 50),
              InkWell(
                onTap: () async {

                  if (logindata.currentState!.validate()) {
                    await loginController.login();
                    loginController.textemail.clear();
                    loginController.textpassword.clear();
                    loginController.textconfimpassword.clear();
                  }
                },
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.lato(
                          color: const Color(0xff18171f),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'or continue with',
                style: GoogleFonts.lato(color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/login/image2.png', height: 40),
                      const SizedBox(width: 10),
                      const Text(
                        'Google',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(onPressed: (){
                    Get.to(LoginPage());
                  }, child:   Text(
                    "LogIn",
                    style: TextStyle(color: Colors.white),
                  ), )


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
