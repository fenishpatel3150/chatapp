import 'package:chatapp/controller/LoginController/LoginController.dart';
import 'package:chatapp/helper/LoginService/Google_Sign_In_service.dart';
import 'package:chatapp/view/ChatScreen/ChatScreen.dart';
import 'package:chatapp/view/Home/HomeScreen.dart';
import 'package:chatapp/view/Login/LoginScreen/LoginPage.dart';
import 'package:chatapp/view/Login/Signup/SignupScreen.dart';
import 'package:chatapp/view/SplashScreen.dart';
import 'package:chatapp/view/introScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return ScreenUtilInit(
builder: (context, child) {
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    getPages: [
      GetPage(
        name: "/", page: ()=> SplashScreen(),
      ),
      GetPage(name: '/intro', page: ()=> GoogleSignInService.googleSignInSarvice.currentUser()==null?IntroScreen():HomeScreen()),
      GetPage(
        name: "/login", page: ()=> LoginPage(),
      ),
      GetPage(
        name: "/signup", page: ()=> SignupScreen(),
      ),
      GetPage(
        name: "/home", page: ()=> HomeScreen(),
      ),
      GetPage(
        name: "/chat", page: ()=> ChatScreen(),
      ),
    ],
  );
},

    );
  }
}
