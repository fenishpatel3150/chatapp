import 'dart:async';

import 'package:chatapp/view/Login/LoginScreen/LoginPage.dart';
import 'package:chatapp/view/Login/Signup/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    Timer(Duration(seconds: 5), () {
      Get.toNamed("/intro");
    });
    return Scaffold(
      backgroundColor: Color(0xff18171f),
      body: Column(
          children: [
            SizedBox(height: 80,),
            Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/login/image1.png'))
                ),
              ),
            ),
            SizedBox(height: 45,),
            Text('Social Chatter',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),),
            Text('Team.',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),),



          ],
      ),
    );
  }
}
