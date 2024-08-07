import 'package:chatapp/view/Login/LoginScreen/LoginPage.dart';
import 'package:chatapp/view/Login/Signup/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18171f),
      body: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/login/image1.png'))
              ),
            ),
            SizedBox(height: 45,),
            Text('Social Chatter',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),),
            Text('Team.',style: GoogleFonts.lato(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),),
           Spacer(),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Color(0xff39383f),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: TextButton(
                      onPressed: (){
                        Get.to(LoginPage());
                      },
                      child: Text('Log In',style: GoogleFonts.lato(color: Color(0xff18171f),fontSize: 19),),
                    ),
                  ),
                  SizedBox(width: 20,),
                  TextButton(
                    onPressed: (){
                      Get.to(SignupScreen());
                    },
                    child: Text('Sign up',style: GoogleFonts.lato(color: Colors.white,fontSize: 19),),
                  )

                ],
              ),
            ),
            SizedBox(height: 20,),


          ],
      ),
    );
  }
}
